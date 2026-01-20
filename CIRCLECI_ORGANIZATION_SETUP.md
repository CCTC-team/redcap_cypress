# CircleCI Organization Setup Guide

## Choosing Between Personal vs Organization Account

You have two options for running CircleCI:

### Option A: Personal CircleCI Account (MintooXavier)
- Run CI under your personal account
- Good for: Individual testing, personal projects
- Limitation: Only you can manage the CI setup

### Option B: CCTC-team Organization Account (Recommended)
- Run CI under the CCTC-team organization
- Good for: Team projects, collaboration
- Benefit: All team members can manage CI

## How to Switch to CCTC-team Organization

### Step 1: Check if CCTC-team Organization Exists in CircleCI

1. In CircleCI, click on the **organization dropdown** (top-left, currently shows "MintooXavier")
2. Look for **"CCTC-team"** in the list
3. If you see it, click to switch to it

### Step 2A: If CCTC-team Organization Exists

Great! Just switch to it and proceed with setup:

1. Click the organization switcher (top-left)
2. Select **"CCTC-team"**
3. You should now see "Organization Settings" for CCTC-team
4. Continue with the setup guide

### Step 2B: If CCTC-team Organization DOESN'T Exist

You need to create/connect it:

1. Go to: https://app.circleci.com/
2. Click **organization switcher** (top-left)
3. Click **"Create Organization"** or **"Add Organization"**
4. Select **"Connect GitHub Organization"**
5. Choose **"CCTC-team"** from the list
6. Authorize CircleCI to access CCTC-team

### Step 3: Verify You're in the Right Organization

Once in CCTC-team organization, you should see:
- Organization name: **CCTC-team** (in top-left)
- Projects from CCTC-team repositories available

## Using Your Personal Account (Alternative)

If you prefer to use your personal CircleCI account:

### Advantages:
- Immediate access (no org setup needed)
- Full control over settings
- Good for testing/development

### Limitations:
- Other team members can't access CI settings
- Billing tied to your personal account
- Not ideal for production/team use

### How to Proceed with Personal Account:

1. **Stay on MintooXavier organization** (where you are now)

2. **Connect to CCTC-team GitHub repositories:**
   - Go to: Projects → Add Project
   - Make sure GitHub shows CCTC-team repositories
   - If not, you may need to authorize access:
     - User Settings → GitHub → Authorize CircleCI
     - Grant access to CCTC-team organization

3. **Create Context:**
   - Organization Settings → Contexts (where you are now)
   - Click **"Create context"**
   - Name it: `REDCap Tests`
   - Add environment variables as documented

4. **Add Project:**
   - Go to: Projects
   - Find: CCTC-team/redcap_cypress
   - Click: "Set Up Project"
   - Select branch: `redcap_val`
   - Use existing config

5. **Update Config File (Important!):**
   - Since you're using personal account, the config file context reference stays the same
   - But you need to ensure the context exists in your personal org

## Recommended Approach

**For Production/Team Use:**
→ Use CCTC-team organization in CircleCI

**For Testing/Development:**
→ Use your personal account (MintooXavier)

## Verification

After setup, verify:

### If Using CCTC-team Org:
- [ ] Organization name shows "CCTC-team" in CircleCI
- [ ] Contexts created under CCTC-team
- [ ] Projects show under CCTC-team
- [ ] Other team members can access

### If Using Personal Account:
- [ ] Organization name shows "MintooXavier" in CircleCI
- [ ] Context "REDCap Tests" created under personal org
- [ ] Project added from CCTC-team GitHub
- [ ] You have permissions to access CCTC-team repos

## SSH Keys Setup

### For CCTC-team Organization:
- Add SSH keys under CCTC-team organization
- All team members share access

### For Personal Account:
- Add SSH keys under your personal account
- Only you have access to manage them

## Context Location

The context name in your config file is: `REDCap Tests`

This context must exist in whichever organization you're using:
- If using CCTC-team: Context should be at `https://app.circleci.com/settings/organization/github/CCTC-team/contexts`
- If using personal: Context should be at `https://app.circleci.com/settings/organization/github/MintooXavier/contexts`

## Next Steps

1. **Decide:** Personal account or CCTC-team organization?
2. **Switch:** If needed, switch to CCTC-team organization
3. **Create Context:** "REDCap Tests" with required variables
4. **Add Project:** redcap_cypress from CCTC-team
5. **Test:** Push a commit and watch it build

## Quick Decision Helper

**Choose CCTC-team Organization if:**
- ✅ This is a team project
- ✅ Others need to manage CI
- ✅ You want centralized billing
- ✅ Standard team workflow

**Choose Personal Account if:**
- ✅ Testing the setup first
- ✅ Only you need access
- ✅ Quick prototype/POC
- ✅ Personal fork of the project

## Still Working After Decision

The CircleCI config file (`config.yml`) will work with either approach - you just need to ensure:
1. Context "REDCap Tests" exists in your chosen organization
2. SSH keys are configured in your chosen organization
3. Environment variables are added to the context

Both approaches will work - it's just about where the CI runs and who can manage it!
