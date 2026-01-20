# CircleCI Prerequisites Checklist

## Current Status

Based on the verification check, the following repositories need to be set up:

## ❌ Missing or Inaccessible Repositories

### 1. CCTC_REDCap_Docker
- **Repository**: `CCTC-team/CCTC_REDCap_Docker`
- **Required Branch**: `MX_MAC`
- **Status**: ❌ Not accessible
- **Action Required**:
  - [ ] Verify repository exists: https://github.com/CCTC-team/CCTC_REDCap_Docker
  - [ ] Ensure you have access to CCTC-team organization
  - [ ] Ensure `MX_MAC` branch exists
  - [ ] Or update config to use correct repository name/branch

### 2. redcap_cypress
- **Repository**: `CCTC-team/redcap_cypress`
- **Required Branch**: `redcap_val`
- **Status**: ❌ Branch not found remotely (but exists locally)
- **Action Required**:
  - [ ] Push `redcap_val` branch to remote:
    ```bash
    git push origin redcap_val
    ```

### 3. redcap_rsvc
- **Repository**: `CCTC-team/redcap_rsvc`
- **Required Branch**: `redcap_val`
- **Status**: ❌ Not accessible
- **Action Required**:
  - [ ] Verify repository exists: https://github.com/CCTC-team/redcap_rsvc
  - [ ] Ensure `redcap_val` branch exists
  - [ ] Or fork from vanderbilt-redcap/redcap_rsvc and create branch

### 4. rctf
- **Repository**: `CCTC-team/rctf`
- **Required Branch**: `main`
- **Status**: ❌ Not accessible
- **Action Required**:
  - [ ] Verify repository exists: https://github.com/CCTC-team/rctf
  - [ ] Ensure `main` branch exists
  - [ ] Or fork from vanderbilt-redcap/rctf

### 5. redcap_cypress_build_reports
- **Repository**: `CCTC-team/redcap_cypress_build_reports`
- **Required Branch**: Any (used for storing build artifacts)
- **Status**: ❌ Not accessible
- **Action Required**:
  - [ ] Create new repository: https://github.com/organizations/CCTC-team/repositories/new
  - [ ] Repository name: `redcap_cypress_build_reports`
  - [ ] Initialize with README
  - [ ] This repo stores HTML coverage reports from CI builds

## Alternative: Use Existing Repositories

If you want to use existing repositories instead of CCTC-team, you can:

### Option A: Use vanderbilt-redcap repositories

Update the CircleCI config to use upstream repositories:

1. For repos that don't need to be in CCTC-team (rctf, redcap_rsvc):
   - Use `vanderbilt-redcap/rctf`
   - Use `vanderbilt-redcap/redcap_rsvc`

2. Update `.circleci/config.yml`:
   ```yaml
   # Change this line:
   git clone --branch ${CCTC_DOCKER_BRANCH} git@github.com:CCTC-team/CCTC_REDCap_Docker.git
   # To use a different Docker setup or path
   ```

### Option B: Fork Required Repositories

If you want to maintain your own versions:

1. **Fork these repositories to CCTC-team**:
   - https://github.com/vanderbilt-redcap/redcap_rsvc → `CCTC-team/redcap_rsvc`
   - https://github.com/vanderbilt-redcap/rctf → `CCTC-team/rctf`

2. **Create or verify CCTC_REDCap_Docker exists**:
   - Check if `CCTC-team/CCTC_REDCap_Docker` exists
   - If not, you may need to adjust the config to point to the correct location

3. **Create branches as needed**:
   ```bash
   # For redcap_rsvc
   cd /path/to/redcap_rsvc
   git checkout -b redcap_val
   git push origin redcap_val

   # Similar for other repos
   ```

## Recommended Setup Steps

### Step 1: Verify CCTC-team Organization Access

1. Go to: https://github.com/orgs/CCTC-team/repositories
2. Verify you can see the organization
3. Check your role (Admin/Member)

### Step 2: Check Which Repositories Exist

Manually check which repos are already available:
- [ ] https://github.com/CCTC-team/CCTC_REDCap_Docker
- [ ] https://github.com/CCTC-team/redcap_cypress (should exist - you're working in it)
- [ ] https://github.com/CCTC-team/redcap_rsvc
- [ ] https://github.com/CCTC-team/rctf
- [ ] https://github.com/CCTC-team/redcap_cypress_build_reports

### Step 3: Decision Point

Based on what exists, decide:

**Scenario A: All repositories exist in CCTC-team**
- Push missing branches
- Verify access permissions
- Proceed with CircleCI setup

**Scenario B: Some repositories don't exist**
- Fork from vanderbilt-redcap
- Create missing repositories
- Set up required branches
- Proceed with CircleCI setup

**Scenario C: Use mixed approach**
- Use CCTC-team repos where they exist
- Use vanderbilt-redcap repos for others
- Update CircleCI config accordingly

## Quick Actions You Can Do Now

### 1. Push redcap_val branch (if not pushed)
```bash
cd /Users/min2suz/redcap_cypress_docker/redcap_v15/redcap_cypress_docker/redcap_cypress
git push origin redcap_val
```

### 2. Check CCTC-team repositories
Open your browser and manually check each URL to see which exist.

### 3. Contact Team Lead
If you're unsure about repository setup, contact your CCTC-team lead to:
- Get proper access to repositories
- Understand the repository structure
- Get credentials for CircleCI setup

## Next Steps

Once repositories are verified/created and accessible:
1. Run `./verify-circleci-repos.sh` again to confirm
2. Follow `CIRCLECI_SETUP.md` for CircleCI configuration
3. Test the pipeline

## Questions to Answer

To help you proceed, please determine:

1. **Does CCTC_REDCap_Docker exist?**
   - If yes, what's the URL and main branch name?
   - If no, do you need to create it or use a different Docker setup?

2. **Do you have admin access to CCTC-team?**
   - Needed to create repositories and configure CircleCI

3. **Should we use vanderbilt-redcap repos directly?**
   - Or fork them to CCTC-team?
   - Or use a mixed approach?

4. **What is the naming convention?**
   - Is it `CCTC_REDCap_Docker` or `cctc-redcap-docker`?
   - GitHub is case-sensitive for repository names
