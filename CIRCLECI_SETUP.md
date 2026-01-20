# CircleCI Setup Guide for CCTC_REDCap_Docker

## Prerequisites
- Admin access to CCTC-team GitHub organization
- Admin access to CircleCI project
- Access to REDCap API credentials

## 1. Project Setup

1. Go to https://app.circleci.com/
2. Navigate to **Projects** → Find **"redcap_cypress"** under CCTC-team
3. Click **"Set Up Project"**
4. Choose **"Use existing config"**
5. Select branch: **redcap_val**
6. Click **"Set Up Project"**

## 2. SSH Keys Configuration

### Method A: User Key (Recommended for Development)

1. Go to: **Project Settings → SSH Keys**
2. Under **"User Key"** section
3. Click **"Authorize with GitHub"**
4. Grant CircleCI access to your repositories

### Method B: Deploy Keys (Recommended for Production)

Run the provided script to generate keys:
```bash
bash setup-circleci-keys.sh
```

Then add public keys as Deploy Keys to each repository:
- CCTC_REDCap_Docker (read-only)
- redcap_rsvc (read-only)
- rctf (read-only)
- redcap_cypress_build_reports (**WRITE ACCESS REQUIRED**)

Add private keys to CircleCI:
1. Go to: **Project Settings → SSH Keys → Additional SSH Keys**
2. Click **"Add SSH Key"**
3. Hostname: `github.com`
4. Paste private key content

## 3. Create Context: "REDCap Tests"

1. Go to https://app.circleci.com/settings/organization/github/CCTC-team/contexts
2. Click **"Create Context"**
3. Name: `REDCap Tests`
4. Click **"Create Context"**

## 4. Add Environment Variables to Context

Go to the "REDCap Tests" context and add these variables:

### Required Variables

| Variable Name | Description | Example Value |
|--------------|-------------|---------------|
| `PROJECT_ID` | Cypress Project ID for config | Get from cypress.config.js |
| `RECORD_KEY` | Cypress Dashboard Recording Key | Get from Cypress Dashboard |

### Optional Variables (Override defaults)

| Variable Name | Default Value | Description |
|--------------|---------------|-------------|
| `REDCAP_VERSION` | 14.7.0 | REDCap version to test |
| `CCTC_DOCKER_BRANCH` | main | CCTC_REDCap_Docker branch |
| `CYPRESS_BRANCH` | redcap_val | redcap_cypress branch |
| `RSVC_BRANCH` | redcap_val | redcap_rsvc branch |
| `RCTF_BRANCH` | main | rctf branch |

### How to Add Variables:

1. Go to: https://app.circleci.com/settings/organization/github/CCTC-team/contexts
2. Click **"REDCap Tests"**
3. Click **"Add Environment Variable"**
4. Enter variable name and value
5. Click **"Add Environment Variable"**
6. Repeat for each variable

## 5. Required GitHub Repository Settings

### A. Enable redcap_val branch protection (optional but recommended)

1. Go to: https://github.com/CCTC-team/redcap_cypress/settings/branches
2. Add rule for `redcap_val` branch
3. Enable:
   - ✓ Require status checks before merging
   - ✓ Require branches to be up to date
   - ✓ Select CircleCI checks

### B. Verify repository access

Ensure these repositories exist and are accessible:
- ✓ https://github.com/CCTC-team/CCTC_REDCap_Docker
- ✓ https://github.com/CCTC-team/redcap_cypress
- ✓ https://github.com/CCTC-team/vanderbilt_redcap_rsvc
- ✓ https://github.com/CCTC-team/rctf

### C. Ensure correct branches exist

- CCTC_REDCap_Docker: `MX_MAC` branch
- redcap_cypress: `redcap_val` branch
- vanderbilt_redcap_rsvc: `redcap_val` branch
- rctf: `main` branch

## 6. Getting Required Credentials

### A. Get Cypress Dashboard Recording Key

1. Go to https://dashboard.cypress.io/
2. Navigate to your project
3. Go to **Settings → Record Keys**
4. Copy the Record Key
5. Add as `RECORD_KEY` in CircleCI context

### B. Get Project ID

1. Check your `cypress.config.js.example` file for the project ID placeholder
2. Or use your Cypress project ID if you have one
3. Add as `PROJECT_ID` in CircleCI context
4. This is used to configure Cypress tests, not CircleCI project settings

## 7. Test the Configuration

### A. Validate configuration locally (optional)

```bash
cd /path/to/redcap_cypress
circleci config validate .circleci/config.yml
```

### B. Trigger a test build

1. Push a commit to `redcap_val` branch:
```bash
git checkout redcap_val
git add .circleci/config.yml
git commit -m "Update CircleCI config for CCTC_REDCap_Docker"
git push origin redcap_val
```

2. Monitor the build in CircleCI:
   - Go to https://app.circleci.com/pipelines/github/CCTC-team/redcap_cypress
   - Watch for the new pipeline
   - Click on the workflow to see job details

### C. Check for common issues

During the first run, watch for:
- ✓ SSH authentication successful for all repos
- ✓ Docker containers start properly (debian container)
- ✓ MySQL volume created successfully
- ✓ Package.json dependencies updated to CCTC-team repos
- ✓ Branch checkouts working (redcap_val)
- ✓ Tests running successfully

## 8. Troubleshooting

### Issue: "Permission denied (publickey)" errors

**Solution:** SSH keys not configured properly
- Go to **Project Settings → SSH Keys**
- Add User Key or Deploy Keys for each repository

### Issue: "Context not found" error

**Solution:** Context name mismatch
- Ensure context is named exactly: `REDCap Tests` (case-sensitive)
- Ensure your user has access to the context

### Issue: "Environment variable not set" errors

**Solution:** Missing environment variables
- Check all required variables are added to "REDCap Tests" context
- Verify variable names match exactly (case-sensitive)

### Issue: Docker container "debian" not found

**Solution:** Wrong Docker setup
- Ensure CCTC_REDCap_Docker is being cloned (not redcap_docker)
- Check docker compose build step completed successfully
- Container name in CCTC setup is `debian`, not `redcap_docker-app-1`

### Issue: Branch not found errors

**Solution:** Branches don't exist in CCTC-team repos
- Ensure `redcap_val` branch exists in redcap_cypress
- Ensure `redcap_val` branch exists in redcap_rsvc
- Ensure `main` branch exists in CCTC_REDCap_Docker
- Ensure `main` branch exists in rctf

## 9. Next Steps After Successful Setup

1. **Set up scheduled workflows** (optional):
   - Go to **Project Settings → Triggers**
   - Create scheduled pipelines for nightly/weekly runs

2. **Configure notifications**:
   - Go to **Project Settings → Notifications**
   - Set up email/Slack notifications for build failures

3. **Review parallelism settings**:
   - Current setting: 30 parallel containers
   - Adjust based on your CircleCI plan and needs

4. **Monitor resource usage**:
   - Check build times and resource usage
   - Optimize if needed (change machine size, parallelism, etc.)

## Support

- CircleCI Documentation: https://circleci.com/docs/
- CCTC Team: Contact your team lead for access issues
- GitHub Issues: Report problems in redcap_cypress repository
