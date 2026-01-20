#!/bin/bash

# Script to verify all required CCTC-team repositories and branches are accessible
# Run this before setting up CircleCI to ensure all dependencies are available

set +e  # Don't exit on error, we want to show all results

echo "============================================"
echo "CircleCI Repository & Branch Verification"
echo "============================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check repository and branch
check_repo_branch() {
    local repo=$1
    local branch=$2
    local description=$3

    echo -n "Checking $description ($repo @ $branch)... "

    # Try to check if remote branch exists
    if git ls-remote --exit-code --heads "git@github.com:CCTC-team/$repo.git" "$branch" >/dev/null 2>&1; then
        echo -e "${GREEN}✓ OK${NC}"
        return 0
    else
        echo -e "${RED}✗ FAILED${NC}"
        echo "  → Branch '$branch' not found in CCTC-team/$repo"
        echo "  → URL: https://github.com/CCTC-team/$repo/tree/$branch"
        return 1
    fi
}

# Function to check repository exists
check_repo() {
    local repo=$1
    local description=$2

    echo -n "Checking $description ($repo)... "

    if git ls-remote --exit-code "git@github.com:CCTC-team/$repo.git" >/dev/null 2>&1; then
        echo -e "${GREEN}✓ OK${NC}"
        return 0
    else
        echo -e "${RED}✗ FAILED${NC}"
        echo "  → Repository not found or not accessible: CCTC-team/$repo"
        echo "  → URL: https://github.com/CCTC-team/$repo"
        return 1
    fi
}

echo "Verifying repository access via SSH..."
echo ""

# Check SSH access to GitHub
echo -n "Testing SSH connection to GitHub... "
if ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
    echo -e "${GREEN}✓ OK${NC}"
else
    echo -e "${YELLOW}⚠ WARNING${NC}"
    echo "  → SSH authentication may have issues"
    echo "  → Make sure your SSH key is added to GitHub"
fi
echo ""

# Track failures
failures=0

# Check each required repository and branch
echo "Checking required repositories and branches:"
echo ""

check_repo_branch "CCTC_REDCap_Docker" "MX_MAC" "CCTC REDCap Docker"
((failures+=$?))

check_repo_branch "redcap_source" "14.7.0" "REDCap Source (TODO: Replace with your actual repo/branch)"
((failures+=$?))

check_repo_branch "redcap_cypress" "redcap_val" "REDCap Cypress"
((failures+=$?))

check_repo_branch "vanderbilt_redcap_rsvc" "redcap_val" "REDCap RSVC (Vanderbilt)"
((failures+=$?))

check_repo_branch "rctf" "main" "REDCap Cypress Test Framework"
((failures+=$?))

echo ""
echo "============================================"

if [ $failures -eq 0 ]; then
    echo -e "${GREEN}✓ All repositories and branches are accessible!${NC}"
    echo ""
    echo "You can proceed with CircleCI setup."
    echo "Follow the guide in CIRCLECI_SETUP.md"
    exit 0
else
    echo -e "${RED}✗ $failures check(s) failed${NC}"
    echo ""
    echo "Please resolve the issues above before setting up CircleCI."
    echo ""
    echo "Common solutions:"
    echo "1. Ensure you have access to CCTC-team organization"
    echo "2. Ensure required branches exist in the repositories"
    echo "3. Check your SSH key is added to GitHub"
    echo "4. Contact your team lead for repository access"
    exit 1
fi
