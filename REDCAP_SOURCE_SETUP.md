# REDCap Source Repository Setup for CircleCI

## Overview

Your CircleCI configuration now uses a **private CCTC-team repository** to store and retrieve REDCap install files. This approach keeps REDCap source code secure and accessible only to authorized team members.

## 🚨 ACTION REQUIRED

You need to provide the correct repository name and update the configuration files.

### Current Placeholder

The configuration currently uses `CCTC-team/redcap_source` as a placeholder. You need to:

1. **Find out the actual repository name** from your CCTC-team organization
2. **Replace all occurrences** of `redcap_source` with the correct repository name

Common repository names might be:
- `redcap_install_files`
- `redcap_source`
- `REDCap`
- `redcap_versions`

## Files to Update

Once you know the correct repository name, update these files:

### 1. `.circleci/config.yml` (Line 57)

Current:
```yaml
git clone --depth=1 --branch=$BRANCH git@github.com:CCTC-team/redcap_source.git redcap_v${REDCAP_VERSION}
```

Replace `redcap_source` with your actual repository name:
```yaml
git clone --depth=1 --branch=$BRANCH git@github.com:CCTC-team/YOUR_ACTUAL_REPO_NAME.git redcap_v${REDCAP_VERSION}
```

### 2. `setup-circleci-keys.sh` (Lines 16-17, 36-38)

Update the repository name in:
- The SSH key generation section
- The public key display section

### 3. `verify-circleci-repos.sh` (Line 81)

Update the repository check:
```bash
check_repo_branch "YOUR_ACTUAL_REPO_NAME" "14.7.0" "REDCap Source Files"
```

## REDCap Repository Structure

Your private CCTC-team REDCap repository should be structured with:

### Option A: Tagged by Version (Recommended)

```
CCTC-team/redcap_source/
├── tags: 14.7.0, 14.6.15, 14.5.20, etc.
└── files at each tag:
    ├── index.php
    ├── redcap_connect.php
    ├── Config/
    ├── Classes/
    └── ... (all REDCap files)
```

In this structure:
- Each REDCap version is a **git tag** or **branch** named after the version (e.g., `14.7.0`)
- The repository root contains the REDCap files directly
- No nested folders - just the raw REDCap PHP files

### Option B: Versioned Folders

```
CCTC-team/redcap_source/
└── main branch:
    ├── redcap_v14.7.0/
    │   ├── index.php
    │   ├── Config/
    │   └── ...
    ├── redcap_v14.6.15/
    └── ...
```

If using this structure, update the copy command in `config.yml` (line 62) to account for the nested folder structure.

## Repository File Structure Details

### If files are in repository root (Option A - Recommended):

```yaml
# In config.yml, line 62:
cp -a redcap_v${REDCAP_VERSION}/* .
```

This works when your repo structure is:
```
CCTC-team/redcap_source (tag: 14.7.0)
├── index.php
├── redcap_connect.php
├── Config/
└── Classes/
```

### If files are nested in Resources/ (like Vanderbilt structure):

```yaml
# In config.yml, update lines 61-62 to:
cp -a redcap_v${REDCAP_VERSION}/Resources/install_files/redcap/* .
cp -a redcap_v${REDCAP_VERSION}/Resources/nonversioned_files/* .
```

## Branching Strategy

The config expects branches/tags named after versions:

- `14.7.0` → Contains REDCap version 14.7.0
- `14.6.15` → Contains REDCap version 14.6.15
- `main` → Latest development version (used when `REDCAP_VERSION=99.99.99`)

## SSH Key Setup

Once you know the repository name:

1. Run the SSH key generation script:
   ```bash
   bash setup-circleci-keys.sh
   ```

2. Add the **public key** for redcap_source to your repository:
   - Go to: `https://github.com/CCTC-team/YOUR_REPO_NAME/settings/keys/new`
   - Title: `CircleCI Deploy Key`
   - Key: Paste the public key from `redcap_source_key.pub`
   - **Permissions**: Read-only (uncheck "Allow write access")

3. Add the **private key** to CircleCI:
   - Go to: `https://app.circleci.com/settings/project/github/CCTC-team/redcap_cypress/ssh`
   - Click "Add SSH Key"
   - Hostname: `github.com`
   - Private Key: Paste contents of `redcap_source_key`

## Alternative: Use CircleCI User Key

Instead of generating deploy keys for each repository, you can use a simpler approach:

1. Go to: `https://app.circleci.com/settings/project/github/CCTC-team/redcap_cypress/ssh`
2. Under "User Key" section, click **"Authorize with GitHub"**
3. This grants CircleCI access to ALL repositories you can access in CCTC-team

**Pros**: Simple, no key management
**Cons**: Broader access than needed

## Verifying Setup

After updating the repository name, verify everything is configured:

```bash
bash verify-circleci-repos.sh
```

This checks:
- ✓ All required repositories exist
- ✓ All required branches/tags exist
- ✓ Your SSH key has access

## Questions to Ask Your Team

1. **What is the name of the CCTC-team private repository that stores REDCap install files?**
2. **How is it structured?** (Tags by version? Folders? Branches?)
3. **What branch/tag naming convention is used?** (e.g., `14.7.0`, `v14.7.0`, `release-14.7.0`)
4. **Do I have access to this repository?**

## Next Steps

1. ✅ Find out actual CCTC-team REDCap repository name
2. ✅ Update all TODO comments in configuration files
3. ✅ Run `setup-circleci-keys.sh` to generate SSH keys
4. ✅ Add public keys as Deploy Keys on GitHub
5. ✅ Add private keys to CircleCI
6. ✅ Run `verify-circleci-repos.sh` to confirm access
7. ✅ Commit and push changes
8. ✅ Trigger CircleCI build

## Current Status

- [x] CircleCI config updated to use CCTC-team repository
- [x] SSH key generation script updated
- [x] Verification script updated
- [ ] Actual repository name confirmed
- [ ] Configuration files updated with real repository name
- [ ] SSH keys generated and added
- [ ] CircleCI build successful

## Need Help?

Contact your CCTC-team lead or administrator to get:
- Repository name
- Repository structure details
- Access permissions
