# Migration from CircleCI to GitHub Actions

This guide explains the key differences between the CircleCI and GitHub Actions implementations, and provides a migration strategy.

## Executive Summary

| Aspect | CircleCI | GitHub Actions |
|--------|----------|----------------|
| **Platform** | CircleCI Cloud | GitHub-hosted runners |
| **Parallelism** | 26-30 parallel jobs | Sequential (initially) |
| **Container Registry** | DockerHub / CircleCI | GitHub Container Registry (GHCR) |
| **Secrets** | CircleCI Context | GitHub Secrets |
| **Cost** | CircleCI credits | GitHub Actions minutes (free tier available) |
| **Integration** | External platform | Native GitHub integration |

## Key Differences

### 1. Workflow Structure

#### CircleCI (Before)

```yaml
# .circleci/config.yml
version: 2.1

executors:
  machine-executor:
    machine:
      image: ubuntu-2404:2024.11.1
    resource_class: large

workflows:
  version: 2
  build_and_test:
    jobs:
      - run-tests:
          context: REDCap Tests
      - html-reports:
          requires:
            - run-tests
```

#### GitHub Actions (After)

```yaml
# .github/workflows/build-docker-image.yml
name: Build and Push REDCap Docker Image
on:
  push:
    branches:
      - new_redcap_val

# .github/workflows/cypress-tests.yml
name: REDCap Cypress Tests
on:
  push:
    branches:
      - new_redcap_val
```

**What Changed:**
- Two separate workflow files instead of one config file
- YAML syntax differences (on vs workflows, jobs vs jobs)
- Workflows in `.github/workflows/` directory instead of `.circleci/`

### 2. Parallelism Strategy

#### CircleCI (Before)

```yaml
jobs:
  run-tests:
    parallelism: 26
    steps:
      - run:
          command: |
            npx cypress run \
              --record \
              --parallel \
              --group core-tests
```

- 26-30 parallel containers
- Cypress automatically splits tests
- Requires Cypress Dashboard for coordination

#### GitHub Actions (After)

```yaml
jobs:
  cypress-tests:
    runs-on: ubuntu-latest
    steps:
      - run: |
          npx cypress run \
            --record \
            --ci-build-id ${{ github.run_id }}-${{ github.run_attempt }}
```

- Sequential execution (single job)
- Simpler setup, no test splitting needed
- Can add parallelism later using matrix strategy

**Why the Change:**
- Simpler initial setup
- Lower GitHub Actions minutes usage
- Still records to Cypress Dashboard for history
- Can add parallelism later if needed

**To Add Parallelism Later:**
```yaml
jobs:
  cypress-tests:
    strategy:
      matrix:
        containers: [1, 2, 3, 4, 5, 6]
    # ... rest of config
```

### 3. Environment Variables & Secrets

#### CircleCI (Before)

**CircleCI Context: "REDCap Tests"**
- `PROJECT_ID`
- `RECORD_KEY`
- `REDCAP_VERSION`
- `CCTC_DOCKER_BRANCH`
- `CYPRESS_BRANCH`
- `RSVC_BRANCH`
- `RCTF_BRANCH`

Accessed via: `$PROJECT_ID`, `$RECORD_KEY`

#### GitHub Actions (After)

**GitHub Repository Secrets:**
- `PROJECT_ID` → `${{ secrets.PROJECT_ID }}`
- `CYPRESS_RECORD_KEY` → `${{ secrets.CYPRESS_RECORD_KEY }}`
- `CCTC_TEAM_PAT` → `${{ secrets.CCTC_TEAM_PAT }}`
- `REDCAP_SOURCE_SSH_KEY` → `${{ secrets.REDCAP_SOURCE_SSH_KEY }}`
- `DEPLOY_KEY` → `${{ secrets.DEPLOY_KEY }}`

**Workflow Environment Variables:**
```yaml
env:
  REDCAP_VERSION: "14.7.0"
  BOOTSTRAPPING_REDCAP_VERSION: "13.1.37"
```

**What Changed:**
- CircleCI Context → GitHub Secrets
- Different syntax for accessing secrets
- Some variables moved to workflow env section
- Added new secrets for GHCR and private repo access

### 4. Container Names

#### CircleCI (Before)

Used `redcap_docker` submodule:
- Container: `redcap_docker-app-1`
- Database: `redcap_docker-db-1`

```bash
docker exec redcap_docker-app-1 composer install
docker exec redcap_docker-db-1 mysql -e "SHOW DATABASES;"
```

#### GitHub Actions (After)

Uses `CCTC_REDCap_Docker`:
- Container: `debian`
- Database: `mariadb`

```bash
docker exec debian composer install
docker exec mariadb mysql -e "SHOW DATABASES;"
```

**What Changed:**
- Different Docker Compose setup
- Container names defined in `CCTC_REDCap_Docker/docker-compose.yml`
- MariaDB instead of MySQL

### 5. File Paths

#### CircleCI (Before)

```yaml
working_directory: /home/circleci/project
```

All files under `/home/circleci/project/`:
- `/home/circleci/project/redcap_cypress/`
- `/home/circleci/project/CCTC_REDCap_Docker/`
- `/home/circleci/project/redcap_source/`

#### GitHub Actions (After)

```yaml
# Automatic workspace: /home/runner/work/<repo>/<repo>/
```

Files under `/home/runner/work/<owner>/<repo>/`:
- `/home/runner/work/<owner>/<repo>/redcap_cypress/`
- `/home/runner/work/<owner>/<repo>/CCTC_REDCap_Docker/`
- `/home/runner/work/<owner>/<repo>/redcap_source/`

**What Changed:**
- Different base path
- Use `${{ github.workspace }}` for absolute paths
- Relative paths in Docker Compose still work (`../redcap_source/`)

### 6. Artifacts Storage

#### CircleCI (Before)

```yaml
- store_artifacts:
    path: coverage/cypress/videos
    destination: /home/circleci/project/coverage/cypress/videos
```

- Stored in CircleCI UI
- Accessible via CircleCI dashboard
- Retention based on plan

#### GitHub Actions (After)

```yaml
- uses: actions/upload-artifact@v4
  with:
    name: cypress-videos
    path: redcap_cypress/cypress/videos/
    retention-days: 30
```

- Stored in GitHub Actions artifacts
- Accessible via workflow run page
- 30-day retention (configurable)
- Free storage within limits

**What Changed:**
- Different upload mechanism
- Artifacts in GitHub UI instead of CircleCI
- Explicit retention period
- Better integration with GitHub pull requests

### 7. Database Configuration

#### CircleCI (Before)

```yaml
# Used redcap_docker with MySQL 8.1
# Ephemeral tmpfs database (faster, not persistent)
services:
  db:
    image: mysql:8.1
    volumes:
      - type: tmpfs
        target: /var/lib/mysql
```

#### GitHub Actions (After)

```yaml
# Uses CCTC_REDCap_Docker with MariaDB 10.5.29
# Persistent external volume
services:
  db:
    image: mariadb:10.5.29
    volumes:
      - mySQLVolume:/var/lib/mysql

volumes:
  mySQLVolume:
    external: true
```

**What Changed:**
- MySQL 8.1 → MariaDB 10.5.29
- Ephemeral tmpfs → Persistent external volume
- Must create volume before starting: `docker volume create mySQLVolume`
- Must cleanup volume after tests: `docker volume rm mySQLVolume`

### 8. Cypress Configuration

#### CircleCI (Before)

```bash
# Substituted PID in cypress.config.js
sed "s/PID/$PROJECT_ID/g" cypress.config.js.example > cypress.config.js
```

#### GitHub Actions (After)

```bash
# Copy template (PID already hardcoded)
cp cypress.config.js.example cypress.config.js

# Update if needed
sed -i "s/projectId: '6dw6bj'/projectId: '$PROJECT_ID'/g" cypress.config.js
```

**What Changed:**
- PROJECT_ID is already hardcoded as '6dw6bj' in example file
- Only substitute if you need a different project ID
- Same approach for cypress.env.json (update version, host, path)

### 9. Docker Image Strategy

#### CircleCI (Before)

```yaml
- run:
    name: Build Docker environment
    command: |
      cd redcap_docker
      docker compose build
      docker compose up -d
```

- Built Docker image from scratch each run
- No image caching between runs
- ~5-10 minutes build time per run

#### GitHub Actions (After)

**Workflow 1: Build and push to GHCR**
```yaml
- uses: docker/build-push-action@v5
  with:
    push: true
    tags: ghcr.io/${{ github.repository }}/redcap-env:latest
```

**Workflow 2: Pull from GHCR**
```yaml
- run: docker pull ghcr.io/${{ github.repository }}/redcap-env:latest
```

**What Changed:**
- Two-workflow approach (build once, use many times)
- Images stored in GitHub Container Registry (free)
- Faster test runs (no rebuild needed)
- Can manually trigger image rebuilds

### 10. Test Execution Command

#### CircleCI (Before)

```bash
CYPRESS_prettyEnabled=true npx cypress run \
  --record \
  --key $RECORD_KEY \
  --parallel \
  --group core-tests \
  --browser chrome \
  --reporter junit \
  --reporter-options=mochaFile=coverage/test-results/[hash].xml
```

#### GitHub Actions (After)

```bash
CYPRESS_prettyEnabled=true npx cypress run \
  --record \
  --key $CYPRESS_RECORD_KEY \
  --group core-tests \
  --browser chrome \
  --ci-build-id ${{ github.run_id }}-${{ github.run_attempt }} \
  --reporter junit \
  --reporter-options "mochaFile=results/test-results-[hash].xml,toConsole=true"
```

**What Changed:**
- Removed `--parallel` flag (sequential execution)
- Added `--ci-build-id` for unique run identification
- Different reporter output path
- Same browser, reporter, and recording options

## Migration Checklist

### Before Migration

- [ ] Document current CircleCI setup
- [ ] Export environment variables from CircleCI context
- [ ] Note any custom scripts or tools used
- [ ] Backup test artifacts from recent runs
- [ ] Identify dependencies on CircleCI-specific features

### During Migration

- [ ] Create GitHub repository secrets
- [ ] Copy workflow files to `.github/workflows/`
- [ ] Update secret references in workflows
- [ ] Create `new_redcap_val` branch
- [ ] Test Workflow 1 (Docker build)
- [ ] Test Workflow 2 (Cypress tests)
- [ ] Verify artifacts upload correctly
- [ ] Check test results display properly

### After Migration

- [ ] Run several test cycles to verify stability
- [ ] Update team documentation
- [ ] Train team on GitHub Actions UI
- [ ] Set up notifications (if needed)
- [ ] (Optional) Disable CircleCI workflows
- [ ] Monitor GitHub Actions usage/costs

## Rollback Plan

If you need to revert to CircleCI:

1. **CircleCI config is preserved** in `.circleci/config.yml`
2. **Re-enable CircleCI** in project settings
3. **Environment variables** may need to be re-added to CircleCI context
4. **No code changes needed** - CircleCI config is still valid

## Side-by-Side Comparison

| Feature | CircleCI | GitHub Actions | Notes |
|---------|----------|----------------|-------|
| Config file | `.circleci/config.yml` | `.github/workflows/*.yml` | Multiple files in GHA |
| Triggers | `workflows.*.jobs` | `on: push/pull_request` | Different syntax |
| Secrets | CircleCI Context | Repository Secrets | Different access syntax |
| Parallelism | `parallelism: 26` | `strategy.matrix` | GHA requires more config |
| Docker | Native support | Native support | Both work well |
| Caching | `save_cache/restore_cache` | `actions/cache` | Similar functionality |
| Artifacts | `store_artifacts` | `actions/upload-artifact` | Different retention |
| Test results | Native | Requires action | Need `publish-unit-test-result-action` |
| Cost | CircleCI credits | GHA minutes | Free tier available for both |
| UI | CircleCI dashboard | GitHub Actions tab | Both are good |

## Performance Comparison

### CircleCI (Before)

- **Total time:** ~15-20 minutes
- **Build time:** ~5-10 minutes (parallel build)
- **Test time:** ~10-15 minutes (26 parallel jobs)
- **Parallelism:** 26 containers

### GitHub Actions (After)

- **Image build time:** ~10-15 minutes (once)
- **Test time:** ~30-45 minutes (sequential)
- **Total time per run:** ~30-45 minutes (after initial build)
- **Parallelism:** 1 container (can add more)

**Trade-offs:**
- GitHub Actions is slower due to sequential execution
- But simpler to maintain and lower cost
- Can add parallelism later if speed becomes critical

## Cost Comparison

### CircleCI

- **Plan:** Performance plan (~$30/month minimum)
- **Credits:** 25,000 credits/month
- **Usage:** ~500 credits per run × 20 runs = 10,000 credits/month
- **Cost:** Included in plan

### GitHub Actions

- **Free tier:** 2,000 minutes/month for private repos
- **Usage:** ~45 minutes per run × 20 runs = 900 minutes/month
- **Cost:** FREE (within free tier)
- **Overage:** $0.008/minute after free tier

**Winner:** GitHub Actions (significantly cheaper for low-volume usage)

## FAQ

### Q: Can I keep both CircleCI and GitHub Actions running?

**A:** Yes! The configs are separate and won't interfere. You can run both simultaneously during migration.

### Q: Will I lose historical test data?

**A:** CircleCI historical data remains in CircleCI. Cypress Dashboard data persists across platforms.

### Q: Can I migrate back to CircleCI easily?

**A:** Yes, the CircleCI config is preserved. Just re-enable CircleCI in project settings.

### Q: How do I add parallelism to GitHub Actions?

**A:** Use matrix strategy:
```yaml
strategy:
  matrix:
    containers: [1, 2, 3, 4, 5, 6]
```
Requires manual test splitting or Cypress Dashboard.

### Q: What about caching?

**A:** GitHub Actions supports caching via `actions/cache`. npm packages are automatically cached by `actions/setup-node`.

### Q: Can I trigger workflows manually?

**A:** Yes! Use `workflow_dispatch` trigger (already added to both workflows).

### Q: How do I debug failures?

**A:** Check workflow logs in Actions tab, download artifacts, or SSH into runner (with tmate action).

## Support

For issues with migration:

1. Check [TROUBLESHOOTING.md](./TROUBLESHOOTING.md)
2. Review GitHub Actions logs
3. Compare with CircleCI logs for differences
4. Check secrets are correctly configured

## Additional Resources

- [GitHub Actions Migration Guide](https://docs.github.com/en/actions/migrating-to-github-actions)
- [CircleCI vs GitHub Actions](https://docs.github.com/en/actions/migrating-to-github-actions/migrating-from-circleci-to-github-actions)
- [Cypress CI Documentation](https://docs.cypress.io/guides/continuous-integration/introduction)
