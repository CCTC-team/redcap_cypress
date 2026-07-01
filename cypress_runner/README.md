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
