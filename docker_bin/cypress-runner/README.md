# cypress-runner — CI-consistent local test runner

Reproduces the GitHub Actions browser environment **on your Mac**, so failures
that only appear in CI (headless-Linux timing/focus races — e.g. the eConsent
PDF.js survey-options flow) surface locally in a minutes-long loop instead of a
per-CI-run wait.

It runs the Cypress suite inside a Linux container (`cypress/included` +
native Chromium) against the REDCap Docker stack already running on the host.
The container shares the host network and Docker socket, so the suite's
`baseUrl` and the `docker exec`/`docker cp` tasks in `cypress.config.js` work
unchanged.

> This is a **local development tool only**. It is **not** part of the CI path —
> GitHub Actions runs Cypress directly on its Ubuntu runner, which is the real
> target this container imitates. Nothing in the EM workflows references it.

## Prerequisites

The REDCap Docker stack must already be up:

```sh
(cd ../../../redcap_docker && docker compose up -d)   # redcap-app / redcap-db / redcap-mailhog
```

## Usage

Run from the `redcap_cypress` directory:

```sh
# A single spec
./docker_bin/cypress-runner/run.sh --spec \
  "redcap_rsvc/Feature Tests/C/e-Consent framework_24/C.3.24.0105. - eConsent enable.feature"

# Multiple specs (comma-separated, no spaces after commas inside one --spec)
./docker_bin/cypress-runner/run.sh --spec "path/A.feature,path/B.feature"

# The whole suite
./docker_bin/cypress-runner/run.sh
```

Any extra args are passed straight through to `cypress run`.

## CI emulation (`run-ci.sh`)

`run.sh` does a plain `cypress run` over whatever `--spec` you pass. `run-ci.sh`
instead reproduces what a push actually runs in the GitHub `cypress-tests.yml`
workflow:

* **shards** the spec set via `SHARD_INDEX`/`SHARD_TOTAL`, and
* runs each shard through `npm run test:retry-failed` — the same wrapper CI uses
  (reruns failed specs up to `CYPRESS_MAX_ATTEMPTS`, with the stall watchdog) —
  with the same `CYPRESS_*` env CI sets.

```sh
./docker_bin/cypress-runner/run-ci.sh            # all 4 shards, sequential
./docker_bin/cypress-runner/run-ci.sh 3          # only shard 3
./docker_bin/cypress-runner/run-ci.sh 2 4        # shards 2 and 4
SHARD_TOTAL=4 ./docker_bin/cypress-runner/run-ci.sh   # override shard count
FORCE_NPM_CI=1 ./docker_bin/cypress-runner/run-ci.sh  # fresh dep install
INCLUDE_MODULES=1 ./docker_bin/cypress-runner/run-ci.sh  # include EM specs
```

How it differs from CI (and why repro still holds):

* Browser is chromium (vs CI's chrome) — same Blink + PDF.js engine.
* Shards run **sequentially** against the one local REDCap stack; CI runs the 4
  shards in parallel on isolated stacks. The retry wrapper + correct per-shard
  spec set is what reproduces pass/fail; parallelism is only CI's speed trick.
* Spec set is **core-only** (`redcap_rsvc` A–D + `cypress/features`) via
  [`list-core-specs.js`](list-core-specs.js), matching CI's redcap_cypress clone
  which has no EM modules. Your local `redcap_source/modules` would otherwise add
  ~183 EM specs and shift the slicing. Set `INCLUDE_MODULES=1` to use the real
  `scripts/list-specs.js` instead.

## Environment knobs

| Var             | Default    | Effect                                                        |
|-----------------|------------|--------------------------------------------------------------|
| `RUNNER_BROWSER`| `chromium` | Browser passed to `cypress run --browser`.                   |
| `FORCE_NPM_CI`  | `0`        | `1` forces a fresh `npm ci` even if deps are already present.|

Linux `node_modules` live in the named Docker volume `cctc_cypress_node_modules`
(populated by `npm ci` on first run, reused after) — separate from the host's
macOS `node_modules`. After bumping a pinned dependency (e.g. an `rctf` tag),
re-run with `FORCE_NPM_CI=1` once to pick it up.

## How it differs from CI

CI uses an exact amd64 Chrome build; this runner uses native arm64 Chromium for
speed (no emulation). Same Blink engine + PDF.js path, so timing/focus races
reproduce — we trade byte-exact Chrome fidelity for a fast loop. An
amd64 + google-chrome variant lives in the `Dockerfile`'s git history if exact
fidelity is ever needed.
