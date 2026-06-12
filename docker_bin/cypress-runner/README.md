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
