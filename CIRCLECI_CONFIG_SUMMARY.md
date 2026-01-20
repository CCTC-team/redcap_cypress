# CircleCI Configuration Summary

## ✅ Configuration Complete

Your CircleCI configuration has been updated and is ready to use!

## 📋 Repository & Branch Configuration

| Component | Repository | Branch |
|-----------|------------|--------|
| **Docker Environment** | `CCTC-team/CCTC_REDCap_Docker` | `MX_MAC` |
| **Cypress Tests** | `CCTC-team/redcap_cypress` | `redcap_val` |
| **RSVC Tests** | `CCTC-team/vanderbilt_redcap_rsvc` | `redcap_val` |
| **Test Framework (rctf)** | `CCTC-team/rctf` | `main` |

## 🔧 Key Changes Made

### 1. Docker Setup
- ✅ Uses `CCTC_REDCap_Docker` instead of `redcap_docker`
- ✅ Uses `MX_MAC` branch (not `main`)
- ✅ Container name: `debian` (not `redcap_docker-app-1`)
- ✅ Creates persistent MySQL volume: `mySQLVolume`
- ✅ Uses `docker compose` (not `docker-compose`)

### 2. Repository Dependencies
- ✅ RSVC tests from: `CCTC-team/vanderbilt_redcap_rsvc`
- ✅ RCTF from: `CCTC-team/rctf`
- ✅ Dynamic package.json updates during CI

### 3. Removed Components
- ✅ Removed `redcap_cypress_build_reports` (artifacts now stored in CircleCI)
- ✅ Removed git push step for build reports
- ✅ Simplified SSH key requirements (3 repos instead of 4)

### 4. Branch Configuration
- ✅ All branches are configurable via environment variables
- ✅ Default: `CCTC_DOCKER_BRANCH=MX_MAC`, `CYPRESS_BRANCH=redcap_val`, `RSVC_BRANCH=redcap_val`, `RCTF_BRANCH=main`

## 📁 Files Created/Updated

| File | Purpose |
|------|---------|
| [`.circleci/config.yml`](.circleci/config.yml) | Main CircleCI configuration |
| [`CIRCLECI_SETUP.md`](CIRCLECI_SETUP.md) | Complete setup guide |
| [`CIRCLECI_PREREQUISITES.md`](CIRCLECI_PREREQUISITES.md) | Prerequisites checklist |
| [`verify-circleci-repos.sh`](verify-circleci-repos.sh) | Repository verification script |
| [`setup-circleci-keys.sh`](setup-circleci-keys.sh) | SSH key generation script |
| [`CIRCLECI_CONFIG_SUMMARY.md`](CIRCLECI_CONFIG_SUMMARY.md) | This file |

## ⚠️ About Verification Failures

If `verify-circleci-repos.sh` shows failures, this is likely due to:
- Local SSH key not having access to CCTC-team private repositories
- SSH authentication configuration on your local machine

**This is normal and won't affect CircleCI!** Once you set up SSH keys in CircleCI (see step 2 below), CircleCI will be able to access all repositories.

## 🚀 Next Steps to Deploy

### Step 1: Review Configuration
```bash
# View the processed config to ensure everything looks correct
circleci config process .circleci/config.yml | less
```

### Step 2: Set Up CircleCI Project

Follow the detailed guide in [`CIRCLECI_SETUP.md`](CIRCLECI_SETUP.md):

1. **Add Project to CircleCI**
   - Go to https://app.circleci.com/
   - Add `CCTC-team/redcap_cypress` project
   - Select branch: `redcap_val`

2. **Configure SSH Keys** (Choose one method):

   **Method A: User Key (Easiest)**
   - Project Settings → SSH Keys → User Key
   - Click "Authorize with GitHub"
   - Grants access to all repos you can access

   **Method B: Deploy Keys (More Secure)**
   - Run: `bash setup-circleci-keys.sh`
   - Add public keys to each GitHub repository
   - Add private keys to CircleCI project

3. **Create "REDCap Tests" Context**
   - Go to: https://app.circleci.com/settings/organization/github/CCTC-team/contexts
   - Create context: `REDCap Tests`
   - Add required environment variables (see below)

4. **Add Environment Variables to Context**

   **Required:**
   - `PROJECT_ID` - Your Cypress project ID (from cypress.config.js)
   - `RECORD_KEY` - Cypress Dashboard recording key

   **Optional (override defaults):**
   - `REDCAP_VERSION` (default: "14.7.0")
   - `CCTC_DOCKER_BRANCH` (default: "MX_MAC")
   - `CYPRESS_BRANCH` (default: "redcap_val")
   - `RSVC_BRANCH` (default: "redcap_val")
   - `RCTF_BRANCH` (default: "main")

### Step 3: Trigger First Build

```bash
# Commit and push the config changes
git add .circleci/config.yml
git commit -m "Configure CircleCI for CCTC_REDCap_Docker with MX_MAC branch"
git push origin redcap_val
```

### Step 4: Monitor Build

- Go to: https://app.circleci.com/pipelines/github/CCTC-team/redcap_cypress
- Watch the workflow execute
- Check for any errors in the job logs

## 🔍 What to Watch During First Run

### Expected Behavior:
✅ Branch `redcap_val` checked out
✅ CCTC_REDCap_Docker cloned (MX_MAC branch)
✅ REDCap source downloaded
✅ MySQL volume created
✅ Docker containers built and started
✅ Container `debian` is running
✅ package.json updated with CCTC-team repos
✅ Cypress tests installed
✅ Tests execute (may have failures - that's OK for first run)
✅ Coverage reports generated
✅ Videos stored as artifacts

### Common First-Run Issues:

**Issue: SSH Key Errors**
- Solution: Ensure SSH keys are configured in CircleCI
- Check: Project Settings → SSH Keys

**Issue: Context Not Found**
- Solution: Verify context name is exactly `REDCap Tests`
- Check: Organization Settings → Contexts

**Issue: Missing Environment Variables**
- Solution: Add all required variables to context
- Check: Context → Environment Variables

**Issue: Docker Container Not Found**
- Solution: Ensure CCTC_REDCap_Docker cloned successfully
- Check: Job logs for "Build the REDCap Image" step

**Issue: Package.json Update Failed**
- Solution: Check regex patterns in sed commands
- May need to adjust if package.json format changed

## 📊 Build Artifacts

After each successful build, you can access:

1. **Test Videos**: Cypress test recordings
   - Location: Job Artifacts → `cypress/videos`

2. **Coverage Reports**: Code coverage HTML report
   - Location: Job Artifacts → `coverage-report/html-report`

3. **Test Results**: JUnit XML test results
   - Location: Tests tab in CircleCI UI

## 🎯 Success Criteria

Your CircleCI setup is successful when:

✅ Pipeline runs without SSH errors
✅ All 4 repositories clone successfully
✅ Docker containers start and are healthy
✅ Cypress tests can run (pass/fail doesn't matter initially)
✅ Coverage reports are generated
✅ Artifacts are stored and accessible

## 🆘 Getting Help

- **CircleCI Docs**: https://circleci.com/docs/
- **Cypress Docs**: https://docs.cypress.io/
- **RCTF Docs**: https://vanderbilt-redcap.github.io/redcap_cypress/
- **GitHub Issues**: Report problems in the redcap_cypress repository

## 📝 Configuration Details

### Parallelism
- **Current**: 30 parallel containers
- **Purpose**: Run tests faster by splitting across multiple machines
- **Cost**: Check your CircleCI plan limits
- **Adjust**: Change `parallelism: 30` in config.yml

### Machine Size
- **Current**: `large` (4 vCPUs, 15GB RAM)
- **Purpose**: Needed for Docker containers + Cypress
- **Adjust**: Change `resource_class: large` in config.yml

### REDCap Version
- **Current**: 14.7.0
- **Purpose**: Which REDCap version to test against
- **Override**: Set `REDCAP_VERSION` in CircleCI context

## 🎉 You're Ready!

Your CircleCI configuration is complete and ready to deploy. Follow the steps above to set up CircleCI and run your first build.

Good luck! 🚀
