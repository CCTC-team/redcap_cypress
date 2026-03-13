# REDCap Cypress Folder Structure

This document describes the structure of the `redcap_cypress` repository - the CCTC automated testing suite for REDCap using Cypress and Gherkin feature files.

## Root Directory

| File/Folder | Description |
|-------------|-------------|
| `cypress.config.js` | Cypress configuration file with custom Node tasks |
| `cypress.config.js.example` | Example Cypress configuration (copy to `cypress.config.js`) |
| `cypress.env.json` | Environment variables: users, MySQL connection, REDCap version |
| `cypress.env.json.example` | Example environment variables (copy to `cypress.env.json`) |
| `package.json` | NPM dependencies and scripts |
| `package-lock.json` | NPM dependency lock file |
| `README.md` | Main documentation |
| `FOLDER_STRUCTURE.md` | This file |
| `CONTRIBUTING.md` | Contribution guidelines |
| `LICENSE` | MIT License |
| `CITATION.cff` | Citation information |
| `validate_feature_files.js` | JavaScript validator for Gherkin feature files |
| `validate_feature_files.sh` | Shell script for feature file validation |
| `.nycrc` | NYC (code coverage) configuration |
| `.gitignore` | Git ignore rules |
| `.whitesource` | WhiteSource security configuration |

## Key Directories

### `/cypress`

Main Cypress testing directory.

| Subfolder | Description |
|-----------|-------------|
| `features/` | Custom CCTC feature files (contains `e2e.js` entry point) |
| `fixtures/` | Test data files populated by `npm run redcap_rsvc:install` |
| `support/` | Cypress support files and step definitions |
| `downloads/` | Files downloaded during test runs |
| `screenshots/` | Screenshots captured on test failures |

### `/cypress/fixtures`

Test data files copied from `redcap_rsvc/Files/` during installation.

| Subfolder | Description |
|-----------|-------------|
| `cdisc_files/` | CDISC ODM import/export test files |
| `dictionaries/` | Data dictionary CSV files for project creation |
| `import_files/` | CSV and other files used for data import tests |

### `/cypress/support`

| File/Folder | Description |
|-------------|-------------|
| `commands.js` | Custom Cypress commands |
| `e2e.js` | E2E test configuration and global hooks |
| `step_definitions/` | Gherkin step definition files |

### `/cypress/support/step_definitions`

| File | Description |
|------|-------------|
| `index.js` | Main step definitions (re-exports from rctf) |
| `rctf.js` | RCTF core step definitions |
| `noncore.js` | CCTC additional step definitions for non-core features |
| `external_module.js` | Step definitions for external module tests |

### `/redcap_rsvc`

RSVC (Regulatory & Software Validation Committee) automated feature tests. Installed via `npm run redcap_rsvc:install` from [CCTC-team/redcap_rsvc](https://github.com/CCTC-team/redcap_rsvc).

| Item | Description |
|------|-------------|
| `Feature Tests/` | 309 Gherkin `.feature` files organized by section (A, B, C, D) |
| `Files/` | Fixture files (dictionaries, CDISC files, import files) |
| `README.md` | RSVC documentation |
| `DOCUMENTATION.md` | Detailed test documentation |
| `package.json` | RSVC package metadata |
| `CITATION.cff` | Citation information |
| `compare_cloud_results.sh` | Compare cloud CI test results |
| `create_issues.sh` | Create GitHub issues from test results |
| `find_feature_changes.sh` | Detect changed feature files |
| `get_cloud_results.js` | Fetch cloud CI test results |
| `import_video.sh` | Import test run videos |
| `push_lines_changes.sh` | Push line-level changes |
| `upload_videos_to_redcap_project.js` | Upload test videos to a REDCap project |

#### Feature Test Sections

| Section | Focus |
|---------|-------|
| **A** | Configuration, user management, admin assignment, project setup, security, field validation, file repository, draft mode, e-consent, eDocs |
| **B** | Project configuration, user roles/privileges, field/instrument design, survey setup |
| **C** | File repository, e-consent, randomization, project status, data quality, record locking, e-signatures, reporting, eDocs |
| **D** | Two-factor auth, action tags, alerts, automated invitations, branching logic, codebook, data access groups, piping, smart variables, scheduling, and more |

### `/docker_bin`

Shell script wrappers for executing MySQL commands inside the Docker container.

| File | Description |
|------|-------------|
| `mysql` | Wrapper that runs `mysql` inside the `redcap-db` container |
| `mysqldump` | Wrapper that runs `mysqldump` inside the `redcap-db` container |

### `/docbuilder`

Documentation builder tool for generating test documentation from feature files.

| File/Folder | Description |
|-------------|-------------|
| `config.json` | Documentation builder configuration |
| `feature_template.md` | Markdown template for individual feature docs |
| `output_template.md` | Markdown template for output documents |
| `output/` | Generated documentation output |

### `/feature_tests_output`

Output directory for feature test execution results.

### `/test_db`

Database test files and seed data.

### `/user_requirement_specification`

User Requirement Specification documents mapping features to test coverage.

### `/docs`

Additional documentation files.

### `/.circleci`

CircleCI configuration for automated testing pipelines.

### `/.github`

GitHub-specific configuration (workflows, issue templates).

### `/circleci-ssh-keys`

SSH keys for CircleCI CI/CD integration (deploy keys for various repos).

| File | Description |
|------|-------------|
| `cctc_docker_key` / `cctc_docker_key.pub` | Key pair for CCTC Docker repo |
| `rctf_key` / `rctf_key.pub` | Key pair for RCTF repo |
| `redcap_source_key` / `redcap_source_key.pub` | Key pair for REDCap source repo |
| `vanderbilt_redcap_rsvc_key` / `vanderbilt_redcap_rsvc_key.pub` | Key pair for Vanderbilt RSVC repo |

## Images

| File | Description |
|------|-------------|
| `CoreTestWorkflow.png` | Core test workflow diagram |
| `GherkinStepBuilder.png` | Gherkin step builder screenshot |
| `REDCapCypressTestEnvironment.png` | Test environment diagram |
| `RSVCFeatureTestExample.png` | RSVC feature test example |
| `test-environment.png` | Test environment overview |
| `thumbnail.png` | Repository thumbnail |

## NPM Scripts

### Setup & Maintenance

| Script | Description |
|--------|-------------|
| `clean` | Delete `node_modules`, `redcap_rsvc`, `package-lock.json` and reinstall |
| `redcap_rsvc:install` | Clean install and move RSVC files into place |
| `redcap_rsvc:move_files` | Move RSVC from `node_modules` to `redcap_rsvc/` and copy fixtures |

### Validation

| Script | Description |
|--------|-------------|
| `redcap_rsvc:validate_features` | Validate Gherkin feature files |

### Running RSVC Tests

| Script | Description |
|--------|-------------|
| `redcap_rsvc:single_test` | Run the Configuration Check test in Chrome |
| `redcap_rsvc:all_tests` | Run all RSVC tests with recording and parallelism |
| `redcap_rsvc:run_official_tests` | Run all RSVC tests (continues on failure) |

### RCTF Step Definition Tests

| Script | Description |
|--------|-------------|
| `rctf:install_server` | Install `http-server` for RCTF test pages |
| `rctf:run_server` | Start RCTF static test server on port 6060 |
| `rctf:test_server` | Install and start the RCTF test server |
| `rctf:get_step_features` | Copy RCTF step test features into `cypress/features/tests/` |
| `rctf:run_step_tests` | Copy step features and run RCTF step tests |
| `rctf:launch_tests` | Run RCTF step tests against localhost:6060 |
| `rctf:official_tests` | Run RCTF step tests with cloud recording |
| `rctf:write_step_tests` | Open Cypress UI for writing/debugging RCTF step tests |

## Dependencies

### Runtime Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| **rctf** | `CCTC-team/rctf#v15.5.36` | REDCap Cypress Test Framework (core step definitions) |
| **redcap_rsvc** | `CCTC-team/redcap_rsvc#v15.5.36` | RSVC automated feature tests |
| **@badeball/cypress-cucumber-preprocessor** | `^24.0.0` | Gherkin/Cucumber support for Cypress |
| **adm-zip** | `^0.5.16` | ZIP file handling for test operations |

### Dev Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| **cypress-file-upload** | `^5.0.8` | File upload support for Cypress |
| **del-cli** | `^6` | File/directory deletion for build scripts |
| **move-cli** | `^2` | File/directory moving for build scripts |

### Peer Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| **cypress** | `^15.10.0` | E2E testing framework |
