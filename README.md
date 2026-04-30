# CCTC REDCap Cypress Test Suite

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

Tests run automatically via [.github/workflows/cypress-tests.yml](.github/workflows/cypress-tests.yml).

### Triggers

- **Push** to the `redcap_val` branch
- **Manual** via the Actions tab (`workflow_dispatch`)

### What the workflow does

1. Checks out the configured `CYPRESS_BRANCH` of this repo.
2. Reads `redcap_version`, `mysql.docker_container`, `mysql.host`, and `mysql.port` from `cypress.env.json.example` so they aren't hardcoded in the workflow.
3. Clones [CCTC_REDCap_Docker](https://github.com/CCTC-team/CCTC_REDCap_Docker) (`CCTC_DOCKER_BRANCH`) and pulls the matching REDCap source from [CCTC-team/redcap_source](https://github.com/CCTC-team/redcap_source) into `CCTC_REDCap_Docker/redcap_source/`.
4. Builds the Docker image and starts the `app`, `db`, and `mailhog` services, then waits for MariaDB and HTTPS on `:8443` to come up.
5. Generates `cypress.config.js` / `cypress.env.json` from the `.example` files, overriding `mysql.path` to `docker exec -i <container> mysql` and `mysql.port` to `3306` (in-container), and injecting `redcap_source_path` / `edocs_folder` for the runner workspace.
6. Rewrites `package.json` to point `rctf` and `redcap_rsvc` at `CCTC-team` forks (`RCTF_BRANCH`, `RSVC_BRANCH`).
7. Installs dependencies and runs `npm run redcap_rsvc:install`.
8. **Patches `node_modules/rctf/plugins/index.js`** in place to fix `afterRunHandler(config)` → `afterRunHandler(config, results)` — see [rctf after:run patch](#rctf-afterrun-patch) below.
9. **Shards specs across 4 parallel jobs** (`SHARD_TOTAL=4`) using `scripts/list-specs.js`, then runs `npm run test:retry-failed -- --spec-file shard-specs.txt` (up to `CYPRESS_MAX_ATTEMPTS=3` retries per failed spec).
10. Generates a phpcov coverage report from the `redcap-app` container if `phpcov.phar` is present.
11. Uploads videos (always), screenshots (on failure), and coverage as artifacts (30-day retention).
12. Tears down the Docker stack with `docker compose down -v`.

### Configurable env vars (top of the workflow)

| Variable | Default | Purpose |
|----------|---------|---------|
| `CCTC_DOCKER_BRANCH` | `redcap_val` | Branch of `CCTC_REDCap_Docker` to clone |
| `CYPRESS_BRANCH` | `redcap_val` | Branch of this repo to test |
| `RSVC_BRANCH` | `redcap_val` | Branch of `redcap_rsvc` to install |
| `RCTF_BRANCH` | `redcap_val` | Branch of `rctf` to install |
| `SHARD_TOTAL` | `4` | Number of parallel shards (also update the `matrix.shard` list) |

### Stability controls (per-job env)

| Variable | Default | Purpose |
|----------|---------|---------|
| `CYPRESS_DISABLE_RECORDING` | `1` | Disables Cypress Cloud recording to avoid `api.cypress.io` stalls |
| `CYPRESS_STALL_MS` | `300000` | Watchdog: kill the run if no spec report is written for 5 min (tightened now that the rctf hang is patched at install — any 5-min stall is a real bug) |
| `CYPRESS_MAX_ATTEMPTS` | `3` | Max retry attempts per failed spec |
| `CYPRESS_BROWSER` | `chrome` | Browser used for headless runs |

### Required repository secrets

| Secret | Used for |
|--------|----------|
| `DEPLOY_KEY` | SSH key for `actions/checkout` of this repo |
| `CCTC_TEAM_PAT` | PAT to clone `CCTC_REDCap_Docker` and `redcap_source` over HTTPS |
| `PROJECT_ID` | Substituted into `cypress.config.js` (replaces `PID` placeholder) |
| `CYPRESS_RECORD_KEY` | Cypress Cloud key (currently unused while recording is disabled) |

### Artifacts

| Artifact | When | Path |
|----------|------|------|
| `cypress-mochawesome-shard-<n>` | always | per-spec JSONs from `cypress/results/json/` plus a merged `results/test-report-shard-<n>.json` |
| `cypress-videos-shard-<n>` | always | `cypress/videos/` |
| `cypress-screenshots-shard-<n>` | on failure | `cypress/screenshots/` |
| `coverage-reports-shard-<n>` | always | `/tmp/path/coverage-report/` |

A separate workflow, [.github/workflows/build-docker-image.yml](.github/workflows/build-docker-image.yml), builds the Docker image independently of the test run.

### rctf after:run patch

`rctf/plugins/index.js` registers an `after:run` handler that calls `afterRunHandler(config)` and drops the `results` argument the cucumber preprocessor expects. Inside the preprocessor that becomes `'totalFailed' in undefined`, which throws *after every spec has finished and written its report*. On the Module API path used by `scripts/rerun-failed.js`, the throw can leave Cypress' internal promise chain dangling so `await cypress.run()` never returns — symptoms are post-run hangs (every shard finishes 62/62 specs then sits idle until a watchdog or job timeout fires).

**Primary fix (workflow-level).** The "Patch rctf after:run handler" step `sed`s the installed copy of `node_modules/rctf/plugins/index.js` from `afterRunHandler(config);` to `afterRunHandler(config, results);` once per CI run. Idempotent (greps for the patched form first), so it's safe if rctf upstream eventually fixes the bug. Mirrors the same step used in the [Versioning EM workflow](https://github.com/CCTC-team/versioning_v1.0.1/blob/main/.github/workflows/cypress-tests.yml).

**Fallback safety net (script-level).** [scripts/rerun-failed.js](scripts/rerun-failed.js) keeps a layered defense (`isCosmeticCrash` regex, `runWithCosmeticDetection` race against an `unhandledRejection` signal, disk-fallback that reads per-spec mochawesome JSONs to determine retries) that activated this same bug pattern *before* the workflow patch existed. With the patch in place this code is inert and harmless; it remains so the script behaves safely if the patch step is ever skipped, fails silently, or the script is invoked outside the workflow.

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