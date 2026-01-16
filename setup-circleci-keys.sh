#!/bin/bash

# Script to generate SSH keys for CircleCI to access CCTC-team repositories
# Run this script and add the public keys to each repository's deploy keys

echo "Generating SSH keys for CircleCI..."

# Create a directory for the keys
mkdir -p circleci-ssh-keys
cd circleci-ssh-keys

# Generate keys for each repository
echo -e "\n=== Generating key for CCTC_REDCap_Docker ==="
ssh-keygen -t ed25519 -C "circleci-cctc-docker" -f cctc_docker_key -N ""

echo -e "\n=== Generating key for vanderbilt_redcap_rsvc ==="
ssh-keygen -t ed25519 -C "circleci-vanderbilt-redcap-rsvc" -f vanderbilt_redcap_rsvc_key -N ""

echo -e "\n=== Generating key for rctf ==="
ssh-keygen -t ed25519 -C "circleci-rctf" -f rctf_key -N ""

echo -e "\n============================================"
echo "Keys generated successfully!"
echo "============================================"

echo -e "\nNext steps:"
echo "1. Add these PUBLIC keys as Deploy Keys in GitHub:"
echo ""
echo "   For CCTC_REDCap_Docker:"
echo "   https://github.com/CCTC-team/CCTC_REDCap_Docker/settings/keys/new"
cat cctc_docker_key.pub
echo ""
echo "   For vanderbilt_redcap_rsvc:"
echo "   https://github.com/CCTC-team/vanderbilt_redcap_rsvc/settings/keys/new"
cat vanderbilt_redcap_rsvc_key.pub
echo ""
echo "   For rctf:"
echo "   https://github.com/CCTC-team/rctf/settings/keys/new"
cat rctf_key.pub
echo ""
echo "2. Add the PRIVATE keys to CircleCI:"
echo "   https://app.circleci.com/settings/project/github/CCTC-team/redcap_cypress/ssh"
echo "   - Click 'Add SSH Key'"
echo "   - Hostname: github.com"
echo "   - Paste the private key content"
echo ""
echo "Private keys are located in: $(pwd)"
echo ""
echo "⚠️  IMPORTANT: Keep private keys secure and delete them after adding to CircleCI!"
