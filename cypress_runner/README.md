# Cypress runner image (`cypress_runner/`)

A **self-contained Cypress runner** with the `redcap_rsvc` feature tests and the
`rctf` framework **baked in**. Run it on demand to execute the suite (headless)
against a running all-in-one REDCap container ([`../../redcap_docker_aio/`](../../redcap_docker_aio/README.md)).

Built image: **`cctc/redcap-cypress:${CYPRESS_TAG}`** (e.g.
`cctc/redcap-cypress:15.10.0`).

---

## Prerequisites

1. **The REDCap container must be running:**
   ```bash
   cd ../../redcap_docker_aio && docker compose up -d
   ```
2. **An SSH key with access to the private `CCTC-team/rctf` and
   `CCTC-team/redcap_rsvc` repos loaded in your ssh-agent** — `npm ci` clones
   them during the build (`ssh-add -l` to check).

---

## Build (once)

```bash
cd CCTC_REDCap_Docker/redcap_cypress/cypress_runner
cp .env.example .env
docker compose build --ssh default
```

`--ssh default` forwards your ssh-agent into the build so `npm ci` can clone the
private `rctf` / `redcap_rsvc` GitHub dependencies. (They can't just be copied
from the host `node_modules` — that has macOS-native binaries; the Linux image
must install its own.)

> **Publishing this image (native arm64 / multi-arch).** CI (`build-cypress-runner-aio.yml`)
> publishes **`linux/amd64`** only. To publish multi-arch (`amd64` + native `arm64`)
> manifests of this runner image **and** the REDCap AIO image together, run
> [`scripts/build-and-push-ghcr.sh`](../../scripts/build-and-push-ghcr.sh) from the
> parent `CCTC_REDCap_Docker` repo (`RUNNER_ONLY=1` for just this image). It builds
> the runner from `cypress_runner/Dockerfile` and pushes to the same GHCR path CI uses.

---

## Run the suite

```bash
# whole suite
docker compose run --rm cypress

# a single spec (or comma-separated specs, no spaces after commas)
docker compose run --rm cypress --spec \
  "redcap_rsvc/Feature Tests/A/Configuration Check_1/A.1.1.0100. - Run Configuration Check.feature"
```

Any extra args pass straight through to `cypress run`. The report (mochawesome
HTML + JSON) lands on the host in **`cypress_runner/results/`**.

`cypress run` does **not** stop on a failing spec — it runs them all and reports
pass/fail at the end.

---

## Run one External Module's tests (`EM_MODULE`)

External Modules ship their **own** `automated_tests/` (e.g. Embellish Fields'
`E.123.*` specs) inside the module folder. To run **only** that module's specs
against the REDCap container, set `EM_MODULE` to the module's directory name:

```bash
EM_MODULE=embellish_fields_v1.0.3 docker compose run --rm cypress
```

The runner then:

1. `docker cp`s the **whole module** out of the REDCap container into
   `/work/redcap_source/modules/<EM_MODULE>/` — mirroring its real REDCap install
   path (the same version-decoupled trick it uses for the install SQL). The
   preprocessor finds the module's specs and step definitions in place:
   - features → `specPattern` `../redcap_source/modules/*/automated_tests/**/*.feature`
   - step defs → `../redcap_source/modules/*/automated_tests/step_definitions/*.js`
2. Symlinks the project's `node_modules` up onto `redcap_source` so a module's own
   step defs resolve their `require('@badeball/cypress-cucumber-preprocessor')` (and
   any other dep) **in place** — that path is outside the project tree, so without
   the symlink Node/esbuild can't resolve it and the spec fails to bundle. Modules
   with no custom steps just use the baked shared framework.
3. Runs only that module's `*.feature` specs (excluding `*REDUNDANT*`) through the
   retry harness (`CYPRESS_MAX_ATTEMPTS`, default 3).

The module must be present in the running REDCap container — baked into the AIO
image (it lives under `redcap_source/modules/`) or bind-mounted onto the
container's `modules/` dir. The `E.123.*` specs enable and configure the module
themselves, so no extra setup is needed. This is exactly what the module repo's
CI does (see the EM's `.github/workflows/cypress-tests.yml`).

---

## How it reaches REDCap

The framework talks to REDCap three ways, so the container needs more than an
HTTP route:

| Need | Mechanism |
|------|-----------|
| REDCap UI | `network_mode: host` → `baseUrl https://localhost:8443` (matches REDCap's stored base URL) |
| Database | `docker exec CCTC_REDCap_Docker mysql …` via the mounted Docker socket |
| File repository | `docker exec` / `docker cp` against `CCTC_REDCap_Docker` |
| REDCap install/demo SQL | `entrypoint.sh` `docker cp`s `Resources/sql` out of the running REDCap container (rctf reads it from the local FS) |

The Docker socket is mounted from `${HOME}/.docker/run/docker.sock` (macOS Docker
Desktop has no `/var/run/docker.sock`) — override `DOCKER_SOCK` in `.env` if yours
differs (`docker context inspect --format '{{.Endpoints.docker.Host}}'`).

The all-in-one container is named `CCTC_REDCap_Docker`, so the runner sets
`CYPRESS_MYSQL_CONTAINER` and `CYPRESS_REDCAP_CONTAINER` to it (the upstream
defaults are the old `redcap-db` / `redcap-app`).

---

## Configuration (`.env`)

| Variable | Default | Description |
|----------|---------|-------------|
| `CYPRESS_TAG` | `15.10.0` | image tag → `cctc/redcap-cypress:<tag>` |
| `REDCAP_CONTAINER` | `CCTC_REDCap_Docker` | the running REDCap container to target |
| `CYPRESS_BASE_URL` | `https://localhost:8443` | REDCap base URL |
| `RUNNER_BROWSER` | `chromium` | browser the suite runs in |
| `DOCKER_SOCK` | `${HOME}/.docker/run/docker.sock` | host Docker socket path |
| `EM_MODULE` | _(unset)_ | run only this module dir's `automated_tests` (e.g. `embellish_fields_v1.0.3`) |
| `CYPRESS_MAX_ATTEMPTS` | `3` | retry attempts for a failing spec (shard / `EM_MODULE` modes) |

---

## Interactive mode (`cypress open`)

This image is for **headless `cypress run` only** — it has no display, and the
entrypoint is hardwired to run the suite. For the **GUI** (`cypress open`, to
write/debug tests), run it on the **host** instead, pointed at the same
container:

```bash
cd ..   # the redcap_cypress/ suite root
CYPRESS_MYSQL_CONTAINER=CCTC_REDCap_Docker \
CYPRESS_REDCAP_CONTAINER=CCTC_REDCap_Docker \
npx cypress open --e2e --browser chrome
```

(The host already has Cypress + deps installed and `../redcap_source` as a sibling,
so the SQL seeds resolve natively.)
