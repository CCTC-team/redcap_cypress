# CCTC REDCap Cypress Test Suite

[![REDCap Cypress Tests (AIO)](https://github.com/CCTC-team/redcap_cypress/actions/workflows/cypress-tests-aio.yml/badge.svg?branch=redcap_val)](https://github.com/CCTC-team/redcap_cypress/actions/workflows/cypress-tests-aio.yml)

This repository is a fork of [Vanderbilt's REDCap Cypress repo](https://github.com/vanderbilt-redcap/redcap_cypress) modified to use [CCTC_REDCap_Docker](https://github.com/CCTC-team/CCTC_REDCap_Docker), which mirrors CCTC production settings.

It provides automated Cypress tests for REDCap using BDD-style Gherkin feature files, with both Vanderbilt's official RSVC tests and CCTC's additional validated tests.

---

## Who are we

The Cambridge Cancer Trials Centre (CCTC) is a collaboration between Cambridge University Hospitals NHS Foundation Trust, the University of Cambridge, and Cancer Research UK. Founded in 2007, CCTC designs and conducts clinical trials and studies to improve outcomes for patients with cancer or those at risk of developing it. In 2011, CCTC began hosting the Cambridge Clinical Trials Unit - Cancer Theme (CCTU-CT).

CCTC has two divisions: Cancer Theme, which coordinates trial delivery, and Clinical Operations.

## Prerequisites

- [CCTC REDCap Docker](https://github.com/CCTC-team/CCTC_REDCap_Docker) environment running (see its README for setup)
- Node.js and npm installed
- Cypress `^15.10.0` installed globally or as a peer dependency

## Setup

1. Clone this repo inside the `CCTC_REDCap_Docker` folder:
   ```
   cd CCTC_REDCap_Docker
   git clone git@github.com:CCTC-team/redcap_cypress.git
   ```

2. Copy example configuration files:
   ```
   cd redcap_cypress
   cp cypress.config.js.example cypress.config.js
   cp cypress.env.json.example cypress.env.json
   ```

3. Install dependencies:
   ```
   npm install
   ```

4. Install RSVC feature tests:
   ```
   npm run redcap_rsvc:install
   ```
   This moves `node_modules/redcap_rsvc/` to `redcap_rsvc/` and copies fixture files into `cypress/fixtures/`.

---

## WARNING

**Do NOT configure `cypress.config.js` or `cypress.env.json` with production environment values.**

**If you set the `mysql` section of `cypress.env.json` to your production database, YOU WILL ERASE YOUR PRODUCTION DATABASE.**

The framework resets the database to a clean installation before each feature test (see [Database Strategy](#database-strategy)). Always use a dedicated test environment.

---

## Configuration

### cypress.config.js

Copy `cypress.config.js.example` and update the following URLs to match your environment:

| Setting | Default | Description |
|---------|---------|-------------|
| `baseUrl` | `https://localhost:8443` | The base URL of your REDCap instance. Update the host and port if your Docker setup differs. |
| `mailHogUrl` | `http://localhost:8025` | The URL of the MailHog web UI. Update the host and port if your Docker setup differs. |

These values are referenced throughout the test suite via `Cypress.config('baseUrl')` and `Cypress.config('mailHogUrl')`.

### cypress.env.json

Copy `cypress.env.json.example` and update values for your environment:

```json
{
  "users": {
    "standard": { "user": "test_user", "pass": "Testing123" },
    "admin": { "user": "test_admin", "pass": "Testing123" },
    "Test_Admin": { "user": "Test_Admin", "pass": "Testing123" },
    "Test_User1": { "user": "Test_User1", "pass": "Testing123" },
    "Test_User2": { "user": "Test_User2", "pass": "Testing123" },
    "Test_User3": { "user": "Test_User3", "pass": "Testing123" },
    "Test_User4": { "user": "Test_User4", "pass": "Testing123" }
  },
  "redcap_version": "15.5.36",
  "language": "English",
  "redcap_hooks_path": "/var/www/html/hook_functions.php",
  "temp_folder": "../redcap_source/temp",
  "file_repository": "../redcap_source/redcap_file_repository",
  "mysql": {
    "host": "127.0.0.1",
    "path": "docker_bin/mysql",
    "port": "3400",
    "db_name": "redcap",
    "db_user": "root",
    "db_pass": "root",
    "docker_container": "redcap-db"
  },
  "timezone_override": "Europe/London",
  "bootstrap_settings": {
    "core": true,
    "hooks": false,
    "modules": false,
    "plugins": false,
    "projects": false
  }
}
```

### Configuration Reference

| Variable | Description |
|----------|-------------|
| `redcap_version` | REDCap version to test against. Must match a version available in `../redcap_source/`. |
| `language` | Language setting for REDCap. |
| `redcap_hooks_path` | Path to the hook functions file inside the Docker container. |
| `temp_folder` | Path to the REDCap temp folder. |
| `file_repository` | Path to the REDCap file repository. |
| `timezone_override` | Timezone override for tests (e.g., `Europe/London`). |

### mysql

| Key | Description |
|-----|-------------|
| `host` | MySQL hostname or IP. Use `127.0.0.1` for local Docker access. |
| `path` | Path to the mysql binary wrapper (e.g., `docker_bin/mysql`). |
| `port` | MySQL port exposed by Docker (default: `3400`). |
| `db_name` | Database name (default: `redcap`). |
| `db_user` | Database user (default: `root`). |
| `db_pass` | Database password (default: `root`). |
| `docker_container` | Name of the MySQL Docker container (default: `redcap-db`). |

### bootstrap_settings

Controls what gets bootstrapped before tests run:

| Key | Description |
|-----|-------------|
| `core` | Bootstrap core REDCap tables and data. |
| `hooks` | Bootstrap hook functions. |
| `modules` | Bootstrap external modules. |
| `plugins` | Bootstrap plugins. |
| `projects` | Bootstrap sample projects. |

---

## Database Strategy

The framework resets the database to a known state before each feature test for deterministic results.

Before the test suite runs, the appropriate tables for your specified REDCap version are installed into the MySQL database. The framework needs:

- `../redcap_source/` containing the version-specific REDCap files
- `redcap_version` set in `cypress.env.json` matching an available version

The seed data includes both an **admin user** and a **standard user**. Which user you log in as depends on the feature being tested.

---

## RSVC Feature Tests

Validated feature tests for REDCap LTS are maintained by the Regulatory & Software Validation Committee:
- **Official (Vanderbilt):** https://github.com/vanderbilt-redcap/redcap_rsvc
- **CCTC extended tests:** https://github.com/CCTC-team/redcap_rsvc

CCTC has automated and validated additional feature tests beyond the official set. Additional step definitions supporting these tests are in:
- `cypress/support/step_definitions/noncore.js`
- `cypress/support/step_definitions/external_module.js`

Check the [CCTC Releases Page](https://github.com/CCTC-team/redcap_rsvc/releases) to see available REDCap versions. Older versions are in the [retired repo](https://github.com/CCTC-team/redcap_rsvc_retired/releases).

When installing a specific version, ensure the release tag exists:
```json
"redcap_rsvc": "github:CCTC-team/redcap_rsvc.git#<commit-or-tag>"
```

---

## Running Tests

### Interactive Mode (Cypress UI)

```
npx cypress open
```

Select specs from the Cypress window to run them interactively.

### Headless Mode

```
npx cypress run
```

---

## Test Reports (Mochawesome)

Test results are automatically saved as JSON in `cypress/results/json/` after each run. To generate a combined HTML report:

```bash
npm run report
```

This creates `cypress/results/html/test-report.html` — open it in a browser to view pass/fail results, durations, and error details.

To customise the report filename per run:

```bash
REPORT_NAME=v15.5.36-smoke npx cypress run --browser chrome --spec "..."
```

To clear old results before a fresh run:

```bash
npm run report:clean
```

---

## NPM Scripts Reference

| Script | Description |
|--------|-------------|
| `clean` | Delete `node_modules`, `redcap_rsvc`, `package-lock.json` and reinstall |
| `redcap_rsvc:install` | Clean install and move RSVC files into place |
| `redcap_rsvc:move_files` | Move RSVC from `node_modules` to `redcap_rsvc/` and copy fixtures |
| `redcap_rsvc:validate_features` | Validate Gherkin feature files |
| `redcap_rsvc:single_test` | Run a single RSVC test (Configuration Check) |
| `redcap_rsvc:all_tests` | Run all RSVC tests with recording |
| `report:clean` | Clear old test results |
| `report:merge` | Merge individual JSON results into a single file |
| `report:generate` | Generate HTML report from merged JSON |
| `report` | Run merge + generate (produces `cypress/results/html/test-report.html`) |

---

## GitHub Actions / CI Workflow

Tests run automatically via [.github/workflows/cypress-tests-aio.yml](.github/workflows/cypress-tests-aio.yml) — the **AIO (all-in-one) two-image pipeline**. The green/red badge at the top of this README reflects the latest run of this workflow on `redcap_val`.

Instead of building a 3-container `docker compose` stack and running `npm ci` on the host, each shard boots a single self-contained **redcap-aio** container (REDCap + MariaDB + MailHog via supervisord) and runs its baked spec slice inside a prebuilt **cypress-runner-aio** image (`rctf` + `redcap_rsvc` baked in). There is no host `npm ci` and no workspace bind-mount.

### Triggers

- **Push** to the `redcap_val` branch (Markdown, `LICENSE`, `.gitignore`, and `docs/**` changes are ignored)
- **Manual** via the Actions tab (`workflow_dispatch`) — optionally pin `runner_tag` to re-test an existing runner image without rebuilding

### What the workflow does

1. **`build-runner`** — builds and pushes the `cypress-runner-aio` image from **this commit**, tagging it with the immutable per-commit short SHA (plus `latest` on the default branch). Private `github:` deps (`rctf`, `redcap_rsvc`) are cloned via a BuildKit SSH/token secret (`CCTC_TEAM_PAT`) that is never persisted into the image. Old image versions are pruned to the latest 2. Skipped when a manual dispatch pins an existing `runner_tag`.
2. **`cypress-tests`** (matrix of `SHARD_TOTAL=8` shards) — each shard `needs:` the build and pulls that **exact per-commit SHA** tag (never `:latest`, avoiding the old build/test race). It pulls the `redcap-aio` image (`:latest`), boots it (`-p 8443:8443 -p 8025:8025`, volume `cctc_mariadb_data`), waits for HTTPS on `:8443`, then runs the runner container over `--network host` with the Docker socket mounted. The runner enumerates its `SHARD_INDEX/SHARD_TOTAL` spec slice and runs it with up to `CYPRESS_MAX_ATTEMPTS=3` retries, reaching the AIO container's DB/files via `docker exec`. A failing spec fails only that shard (`fail-fast: false`).
3. **`publish-report`** — downloads every shard's mochawesome JSON (kept in per-shard subdirs to avoid basename collisions), resolves the **REDCap version under test** (each shard records it in `redcap_version.txt`), and merges them into a combined report. Reports are **versioned by REDCap version and preserved across runs**: the job restores the accumulated site from a `pages-store` branch, writes this run's report to `<version>/redcap_v<version>.html`, regenerates a root version index (newest first, `(latest)` marked), force-pushes the snapshot back, and deploys the whole tree to **GitHub Pages**. Browse at `https://cctc-team.github.io/redcap_cypress/`; each version's report is at `/<version>/redcap_v<version>.html` (the bare `/<version>/` URL redirects there).
4. **`prune-artifacts`** — best-effort housekeeping (`continue-on-error`, so an API blip never reds a passing run): deletes workflow artifacts from all but the latest `KEEP_RUNS` (2) runs, so per-shard results/screenshots don't grow unbounded in Actions storage. Independent of `build-runner`'s GHCR **image** pruning.

### Configurable env vars (top of the workflow)

| Variable | Default | Purpose |
|----------|---------|---------|
| `SHARD_TOTAL` | `8` | Number of parallel shards (also update the `matrix.shard` list) |
| `AIO_IMAGE` | `ghcr.io/cctc-team/cctc_redcap_docker/redcap-aio:latest` | The all-in-one REDCap image under test |
| `IMAGE_NAME` | `cctc-team/redcap_cypress/cypress-runner-aio` | GHCR repo for the runner image built by `build-runner` |
| `RUNNER_TAG` | `15.10.0` | Kept in lockstep with the `cypress/included` base tag in `cypress_runner/Dockerfile` |

The `redcap-aio` and `cypress-runner-aio` images must target the **same REDCap version**. `rctf` and `redcap_rsvc` versions are pinned in `package.json` / `package-lock.json` and baked into the runner image, not set via workflow env vars.

### Stability controls (per-run env passed to the runner)

| Variable | Default | Purpose |
|----------|---------|---------|
| `CYPRESS_MAX_ATTEMPTS` | `3` | Max retry attempts per failed spec |
| `CYPRESS_STALL_MS` | `3600000` | Watchdog: abort the run if no spec report is written for the interval |
| `RUNNER_BROWSER` | `chromium` | Browser used for headless runs |

### Required repository secrets

| Secret | Used for |
|--------|----------|
| `CCTC_TEAM_PAT` | Cloning private `github:` deps into the runner image, GHCR login, and image-version pruning |
| `GITHUB_TOKEN` | GHCR login for the `build-runner` push (built-in) |

### Artifacts

| Artifact | When | Path |
|----------|------|------|
| `cypress-aio-shard-<n>-results` | always | per-spec mochawesome JSON (`results/json/*.json`) plus HTML (`results/html/**`) — 7-day retention |
| `cypress-aio-shard-<n>-screenshots` | on failure | `screenshots/` — 7-day retention |
| Versioned HTML report | always | accumulated on the `pages-store` branch and published to GitHub Pages by `publish-report` at `/<REDCap version>/redcap_v<version>.html` |

A separate workflow, [.github/workflows/build-cypress-runner-aio.yml](.github/workflows/build-cypress-runner-aio.yml), can build the runner image on manual dispatch; its push trigger is disabled so it no longer double-builds against the test workflow.

---

## Key Dependencies

| Package | Purpose |
|---------|---------|
| [rctf](https://github.com/CCTC-team/rctf) | REDCap Cypress Test Framework - core testing framework |
| [redcap_rsvc](https://github.com/CCTC-team/redcap_rsvc) | RSVC automated feature tests |
| [@badeball/cypress-cucumber-preprocessor](https://github.com/badeball/cypress-cucumber-preprocessor) | Gherkin/Cucumber support for Cypress |
| [cypress](https://www.cypress.io/) | E2E testing framework (peer dependency, `^15.10.0`) |
| cypress-file-upload | File upload support for Cypress tests |
| [mochawesome](https://github.com/adamgruber/mochawesome) | HTML/JSON test report generation |
| mochawesome-merge | Merges multiple Mochawesome JSON files |
| mochawesome-report-generator | Generates HTML reports from merged JSON |