# CCTC REDCap Cypress Test Suite

This repository is a fork of [Vanderbilt's REDCap Cypress repo](https://github.com/vanderbilt-redcap/redcap_cypress) modified to use [CCTC_REDCap_Docker](https://github.com/CCTC-team/CCTC_REDCap_Docker), which mirrors CCTC production settings.

It provides automated Cypress tests for REDCap using BDD-style Gherkin feature files, with both Vanderbilt's official RSVC tests and CCTC's additional validated tests.

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

## NPM Scripts Reference

| Script | Description |
|--------|-------------|
| `clean` | Delete `node_modules`, `redcap_rsvc`, `package-lock.json` and reinstall |
| `redcap_rsvc:install` | Clean install and move RSVC files into place |
| `redcap_rsvc:move_files` | Move RSVC from `node_modules` to `redcap_rsvc/` and copy fixtures |
| `redcap_rsvc:validate_features` | Validate Gherkin feature files |
| `redcap_rsvc:single_test` | Run a single RSVC test (Configuration Check) |
| `redcap_rsvc:all_tests` | Run all RSVC tests with recording |

---

## Key Dependencies

| Package | Purpose |
|---------|---------|
| [rctf](https://github.com/CCTC-team/rctf) | REDCap Cypress Test Framework - core testing framework |
| [redcap_rsvc](https://github.com/CCTC-team/redcap_rsvc) | RSVC automated feature tests |
| [@badeball/cypress-cucumber-preprocessor](https://github.com/badeball/cypress-cucumber-preprocessor) | Gherkin/Cucumber support for Cypress |
| [cypress](https://www.cypress.io/) | E2E testing framework (peer dependency, `^15.10.0`) |
| cypress-file-upload | File upload support for Cypress tests |