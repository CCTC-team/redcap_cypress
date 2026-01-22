# GitHub Actions Setup Guide

This guide walks you through setting up GitHub Actions workflows for automated REDCap Cypress testing with Docker and GitHub Container Registry (GHCR).

## Overview

Two workflows have been created:

1. **build-docker-image.yml** - Builds custom REDCap Docker image and pushes to GHCR
2. **cypress-tests.yml** - Pulls Docker image, runs Cypress tests, stores artifacts

## Prerequisites

Before you begin, ensure you have:

- [x] GitHub repository with admin access
- [x] Access to CCTC-team private repositories
- [x] Cypress Dashboard account (optional, for test recording)
- [x] REDCap installation files
- [x] SSH keys for private repository access

## Step-by-Step Setup

### 1. Configure GitHub Secrets

GitHub Secrets store sensitive information like API keys and SSH keys. You'll need to add several secrets for the workflows to function.

#### Navigate to Secrets Settings

1. Go to your GitHub repository
2. Click **Settings** tab
3. In the left sidebar, click **Secrets and variables** → **Actions**
4. Click **New repository secret**

#### Required Secrets

Add the following secrets one by one:

##### A. CCTC_TEAM_PAT (Personal Access Token)

**Purpose:** Access CCTC-team private repositories

**How to create:**
1. Go to GitHub Settings → Developer settings → Personal access tokens → Fine-grained tokens
2. Click "Generate new token"
3. Set token name: "GitHub Actions - CCTC Repos"
4. Set expiration: 90 days (or custom)
5. Select **Repository access**: "Only select repositories" → Choose CCTC-team repos you need
6. **Permissions:**
   - Repository permissions → Contents: **Read-only**
   - Repository permissions → Metadata: **Read-only** (automatically selected)
7. Click "Generate token"
8. **Copy the token** (you won't see it again!)
9. Add to GitHub Secrets:
   - Name: `CCTC_TEAM_PAT`
   - Value: [paste token]

##### B. REDCAP_SOURCE_SSH_KEY (SSH Deploy Key)

**Purpose:** Clone aldefouw/redcap_source repository

**How to create:**
1. Generate SSH key pair:
   ```bash
   ssh-keygen -t ed25519 -C "github-actions-redcap" -f ~/.ssh/github_redcap_source
   # Press Enter for no passphrase
   ```

2. Add public key to repository:
   - Go to https://github.com/aldefouw/redcap_source/settings/keys
   - Click "Add deploy key"
   - Title: "GitHub Actions CI"
   - Key: Copy contents of `~/.ssh/github_redcap_source.pub`
   - Check "Allow write access": **No** (read-only)
   - Click "Add key"

3. Add private key to GitHub Secrets:
   ```bash
   cat ~/.ssh/github_redcap_source
   ```
   - Name: `REDCAP_SOURCE_SSH_KEY`
   - Value: [paste entire private key including header/footer]

##### C. DEPLOY_KEY (SSH Key for Submodules)

**Purpose:** Checkout repository with submodules (redcap_cypress)

**Option 1: Reuse REDCAP_SOURCE_SSH_KEY**
- If your submodules use the same SSH key, you can reuse the key from step B
- Name: `DEPLOY_KEY`
- Value: [same as REDCAP_SOURCE_SSH_KEY]

**Option 2: Create separate key**
- Follow same steps as REDCAP_SOURCE_SSH_KEY but generate new key
- Add public key to each submodule repository's deploy keys

##### D. CYPRESS_RECORD_KEY (Optional - Cypress Dashboard)

**Purpose:** Record test results to Cypress Dashboard

**How to get:**
1. Log in to https://dashboard.cypress.io
2. Select your project (or create new one)
3. Go to Project Settings
4. Copy the **Record Key**
5. Add to GitHub Secrets:
   - Name: `CYPRESS_RECORD_KEY`
   - Value: [paste record key]

**Note:** This is optional. Tests will run without it, but won't record to Dashboard.

##### E. PROJECT_ID (Optional - REDCap Project ID)

**Purpose:** REDCap project ID for testing (if needed)

**How to get:**
1. From your REDCap instance, note the project ID used for testing
2. Add to GitHub Secrets:
   - Name: `PROJECT_ID`
   - Value: [project ID, e.g., "6dw6bj"]

**Note:** The cypress.config.js currently has this hardcoded as '6dw6bj'. Only add this secret if you need to override it.

#### Secrets Summary Table

| Secret Name | Required | Purpose |
|-------------|----------|---------|
| `CCTC_TEAM_PAT` | ✅ Yes | Access CCTC-team repos |
| `REDCAP_SOURCE_SSH_KEY` | ✅ Yes | Clone redcap_source |
| `DEPLOY_KEY` | ✅ Yes | Checkout submodules |
| `CYPRESS_RECORD_KEY` | ⚠️ Optional | Cypress Dashboard recording |
| `PROJECT_ID` | ⚠️ Optional | Override project ID |

### 2. Enable GitHub Container Registry (GHCR)

GHCR is where Docker images are stored.

#### Enable Package Access

1. Go to repository **Settings** → **Actions** → **General**
2. Scroll to **Workflow permissions**
3. Select **Read and write permissions**
4. Check **Allow GitHub Actions to create and approve pull requests** (optional)
5. Click **Save**

#### Verify GHCR Access

After first workflow run:
1. Go to repository main page
2. Click **Packages** tab (right sidebar)
3. You should see `redcap-env` package listed

#### Set Package Visibility (Optional)

By default, packages are **private**. To make public:
1. Click on the package name
2. Click **Package settings**
3. Scroll to **Danger Zone**
4. Click **Change visibility** → **Public** (if desired)

### 3. Create the new_redcap_val Branch

Workflows are configured to trigger on pushes to `new_redcap_val` branch.

```bash
# In your local repository
git checkout -b new_redcap_val
git push -u origin new_redcap_val
```

### 4. First-Time Workflow Runs

#### Run Workflow 1: Build Docker Image

This workflow builds the REDCap Docker image and pushes it to GHCR.

**Option A: Automatic Trigger (Recommended)**
1. Make a small change to CCTC_REDCap_Docker directory:
   ```bash
   cd CCTC_REDCap_Docker
   touch .trigger  # Create empty file to trigger build
   git add .trigger
   git commit -m "Trigger Docker image build"
   git push origin new_redcap_val
   ```

2. Go to **Actions** tab in GitHub
3. Click on "Build and Push REDCap Docker Image" workflow
4. Monitor the build progress

**Option B: Manual Trigger**
1. Go to **Actions** tab
2. Click "Build and Push REDCap Docker Image" workflow
3. Click **Run workflow** button
4. Select `new_redcap_val` branch
5. (Optional) Enter custom tag
6. Click **Run workflow**

**Expected Result:**
- Workflow completes successfully (green checkmark)
- Image appears in **Packages** tab
- Build takes ~10-15 minutes first time

#### Run Workflow 2: Cypress Tests

This workflow runs after the Docker image is built.

**Automatic Trigger:**
1. Push any change to `new_redcap_val` branch:
   ```bash
   git commit --allow-empty -m "Trigger Cypress tests"
   git push origin new_redcap_val
   ```

2. Go to **Actions** tab
3. Click on "REDCap Cypress Tests" workflow
4. Monitor test execution

**Expected Result:**
- Workflow pulls Docker image from GHCR
- Services start (MariaDB, Apache, MailHog, PHPMyAdmin)
- Cypress tests run
- Artifacts uploaded (videos, test results)
- Test summary appears in workflow page

### 5. Monitoring and Debugging

#### View Workflow Runs

1. Go to **Actions** tab
2. Click on workflow name to see all runs
3. Click on specific run to see details
4. Click on job name to see logs

#### View Test Results

**Option A: GitHub UI**
1. Go to workflow run page
2. Scroll to **Annotations** section
3. View test pass/fail summary
4. Click on failed tests to see details

**Option B: Cypress Dashboard** (if CYPRESS_RECORD_KEY configured)
1. Go to https://dashboard.cypress.io
2. Select your project
3. View detailed test results, videos, screenshots

#### Download Artifacts

1. Go to workflow run page
2. Scroll to **Artifacts** section
3. Download:
   - `cypress-videos` - Test execution videos
   - `cypress-screenshots` - Failure screenshots
   - `coverage-reports` - PHP code coverage

### 6. Verify Integration

#### Checklist

- [ ] Workflow 1 completes successfully
- [ ] Docker image appears in Packages
- [ ] Workflow 2 pulls image and starts services
- [ ] Cypress tests run (even if some fail)
- [ ] Test results appear in workflow summary
- [ ] Artifacts are uploaded
- [ ] (Optional) Tests recorded to Cypress Dashboard

## Common Setup Issues

### Issue: "Resource not accessible by integration"

**Cause:** Insufficient workflow permissions

**Solution:**
1. Settings → Actions → General → Workflow permissions
2. Select "Read and write permissions"
3. Save and re-run workflow

### Issue: "Authentication failed" when cloning repos

**Cause:** Invalid or missing secrets

**Solution:**
1. Verify secrets exist: Settings → Secrets and variables → Actions
2. Check PAT has correct permissions and hasn't expired
3. Verify SSH key was added to repository deploy keys
4. Re-generate and update secrets if needed

### Issue: "Docker image not found"

**Cause:** Workflow 2 ran before Workflow 1 completed

**Solution:**
1. Wait for Workflow 1 to finish
2. Verify image exists in Packages
3. Re-run Workflow 2

### Issue: "Service health check timeout"

**Cause:** Services taking too long to start

**Solution:**
1. Check Docker logs in workflow output
2. Increase timeout in workflow (currently 60 seconds)
3. Verify redcap_source files exist and are valid

## Next Steps

After successful setup:

1. **Configure test patterns**: Edit `cypress.config.js` to include/exclude test files
2. **Add more secrets**: Add environment-specific variables as needed
3. **Set up scheduled runs**: Add cron trigger to run tests nightly
4. **Configure notifications**: Set up Slack/email notifications for failures
5. **Add deployment**: Extend workflow to deploy to staging/production after tests pass

## Need Help?

- Check [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) for common issues
- Review [CIRCLECI_MIGRATION.md](./CIRCLECI_MIGRATION.md) for CircleCI comparison
- Check workflow logs in Actions tab
- Review Cypress Dashboard for test details

## Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitHub Container Registry Docs](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
- [Cypress CI Documentation](https://docs.cypress.io/guides/continuous-integration/introduction)
- [REDCap Cypress Test Framework](https://vanderbilt-redcap.github.io/redcap_cypress/)
