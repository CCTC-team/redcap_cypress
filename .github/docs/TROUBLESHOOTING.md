# Troubleshooting GitHub Actions Workflows

This guide covers common issues you may encounter when running GitHub Actions workflows for REDCap Cypress testing.

## Table of Contents

- [Workflow Won't Start](#workflow-wont-start)
- [Docker Image Build Failures](#docker-image-build-failures)
- [Private Repository Access Issues](#private-repository-access-issues)
- [Service Health Check Timeouts](#service-health-check-timeouts)
- [Cypress Test Failures](#cypress-test-failures)
- [Artifact Upload Issues](#artifact-upload-issues)
- [Permission Denied Errors](#permission-denied-errors)
- [Database Connection Issues](#database-connection-issues)
- [GHCR Authentication Issues](#ghcr-authentication-issues)
- [General Debugging Tips](#general-debugging-tips)

---

## Workflow Won't Start

### Symptom
Workflow doesn't trigger when pushing to `new_redcap_val` branch.

### Common Causes

#### 1. Wrong Branch Name
```bash
# Check current branch
git branch

# If not on new_redcap_val, create it
git checkout -b new_redcap_val
git push -u origin new_redcap_val
```

#### 2. Workflow File Syntax Error
**Error message:** "Invalid workflow file"

**Solution:**
1. Go to Actions tab → Click on workflow name
2. Check for syntax error message
3. Fix YAML indentation (must use spaces, not tabs)
4. Validate YAML: https://www.yamllint.com/

#### 3. Workflow Permissions
**Error message:** "Resource not accessible by integration"

**Solution:**
1. Go to Settings → Actions → General
2. Scroll to "Workflow permissions"
3. Select "Read and write permissions"
4. Save changes
5. Re-run workflow

---

## Docker Image Build Failures

### Symptom
"Build and Push REDCap Docker Image" workflow fails.

### Common Causes

#### 1. Cannot Clone CCTC_REDCap_Docker
**Error message:** "Authentication failed" or "Repository not found"

**Solution:**
1. Verify `CCTC_TEAM_PAT` secret exists and is correct
2. Check PAT hasn't expired
3. Verify PAT has access to `CCTC-team/CCTC_REDCap_Docker` repository
4. Test PAT manually:
   ```bash
   git clone https://x-access-token:YOUR_PAT@github.com/CCTC-team/CCTC_REDCap_Docker.git
   ```

#### 2. Dockerfile Build Errors
**Error message:** Various Dockerfile instruction failures

**Solution:**
1. Check Dockerfile syntax in `CCTC_REDCap_Docker/Dockerfile`
2. Verify base image is available: `php:8.2.28-apache`
3. Check for network issues downloading dependencies
4. Review build logs for specific error
5. Try building locally to reproduce:
   ```bash
   cd CCTC_REDCap_Docker
   docker build -t test-image .
   ```

#### 3. GHCR Push Permission Denied
**Error message:** "denied: permission_denied"

**Solution:**
1. Settings → Actions → General → Workflow permissions → "Read and write permissions"
2. Verify `GITHUB_TOKEN` has `packages: write` permission
3. Check workflow has:
   ```yaml
   permissions:
     contents: read
     packages: write
   ```

#### 4. Out of Disk Space
**Error message:** "no space left on device"

**Solution:**
1. Clean up Docker cache in workflow:
   ```yaml
   - run: docker system prune -af
   ```
2. Use multi-stage builds in Dockerfile
3. Reduce image size by removing unnecessary packages

---

## Private Repository Access Issues

### Symptom
Cannot clone private repositories (redcap_source, REDCap core, etc.)

### Common Causes

#### 1. SSH Key Not Configured
**Error message:** "Permission denied (publickey)"

**Solution:**
1. Verify `REDCAP_SOURCE_SSH_KEY` secret exists
2. Check SSH key was added to repository deploy keys
3. Verify SSH key format (include BEGIN/END markers):
   ```
   -----BEGIN OPENSSH PRIVATE KEY-----
   ...
   -----END OPENSSH PRIVATE KEY-----
   ```
4. Test SSH key locally:
   ```bash
   ssh -T git@github.com -i ~/.ssh/your_key
   ```

#### 2. Deploy Key Doesn't Have Access
**Error message:** "Repository not found"

**Solution:**
1. Go to repository settings → Deploy keys
2. Verify public key is added
3. Check key hasn't been revoked
4. Add key if missing:
   - Copy public key: `cat ~/.ssh/your_key.pub`
   - Add to repo: Settings → Deploy keys → Add deploy key

#### 3. PAT Expired or Invalid
**Error message:** "Authentication failed"

**Solution:**
1. Generate new Personal Access Token
2. Update `CCTC_TEAM_PAT` secret in repository settings
3. Verify PAT has correct scopes: `repo` (full control)

#### 4. Submodule Checkout Fails
**Error message:** "Submodule failed to initialize"

**Solution:**
1. Verify `DEPLOY_KEY` secret is configured
2. Check submodule URL uses SSH format:
   ```bash
   git config --file .gitmodules --list
   ```
3. Ensure workflow uses:
   ```yaml
   - uses: actions/checkout@v4
     with:
       submodules: recursive
       ssh-key: ${{ secrets.DEPLOY_KEY }}
   ```

---

## Service Health Check Timeouts

### Symptom
Workflow fails at "Wait for services to be ready" step.

### Common Causes

#### 1. MariaDB Not Starting
**Error message:** "Timeout waiting for MariaDB"

**Solution:**
1. Check Docker logs:
   ```yaml
   - run: docker logs mariadb
   ```
2. Verify volume was created:
   ```yaml
   - run: docker volume ls | grep mySQLVolume
   ```
3. Check for port conflicts
4. Increase timeout (currently 60 seconds):
   ```bash
   timeout 120 bash -c 'until docker exec mariadb mysqladmin ping; do sleep 2; done'
   ```

#### 2. Apache Not Starting
**Error message:** "Timeout waiting for Apache"

**Solution:**
1. Check Apache logs:
   ```yaml
   - run: docker logs debian
   ```
2. Verify redcap_source files exist and are mounted
3. Check for PHP errors in logs
4. Verify SSL certificates are present in CCTC_REDCap_Docker

#### 3. Services Started But Not Healthy
**Symptoms:** Services appear running but health checks fail

**Solution:**
1. Check service status:
   ```yaml
   - run: docker ps -a
   ```
2. Test connectivity manually:
   ```yaml
   - run: docker exec mariadb mysqladmin ping -u root -proot
   - run: curl -k -v https://localhost:8443
   ```
3. Review docker-compose.yml for configuration issues

---

## Cypress Test Failures

### Symptom
Cypress tests fail during execution.

### Common Causes

#### 1. Configuration File Issues
**Error message:** "cypress.env.json not found" or parsing errors

**Solution:**
1. Check if .example files exist:
   ```yaml
   - run: ls -la redcap_cypress/*.example
   ```
2. Verify sed commands executed successfully
3. Check configuration output:
   ```yaml
   - run: cat redcap_cypress/cypress.env.json
   ```
4. Validate JSON syntax

#### 2. Database Connection Failures
**Error message:** "ECONNREFUSED" or "Access denied"

**Solution:**
1. Verify MySQL host is set to `mariadb` (not `127.0.0.1`)
2. Check database credentials in cypress.env.json:
   ```json
   {
     "mysql": {
       "host": "mariadb",
       "db_user": "root",
       "db_pass": "root"
     }
   }
   ```
3. Test connection from workflow:
   ```yaml
   - run: docker exec mariadb mysql -u root -proot -e "SHOW DATABASES;"
   ```

#### 3. REDCap Not Installed/Configured
**Error message:** 404 errors, "REDCap not found"

**Solution:**
1. Verify redcap_source directory structure:
   ```yaml
   - run: ls -la redcap_source/
   ```
2. Check REDCap version exists:
   ```yaml
   - run: ls -la redcap_source/redcap_v${REDCAP_VERSION}/
   ```
3. Verify files are mounted in container:
   ```yaml
   - run: docker exec debian ls -la /var/www/html/
   ```

#### 4. Missing RCTF or RSVC Dependencies
**Error message:** "rctf not found" or step definition errors

**Solution:**
1. Check package.json updates:
   ```yaml
   - run: cat redcap_cypress/package.json | grep rctf
   ```
2. Verify npm install succeeded:
   ```yaml
   - run: ls -la redcap_cypress/node_modules/rctf/
   ```
3. Check rsvc installation:
   ```yaml
   - run: ls -la redcap_cypress/redcap_rsvc/
   ```

#### 5. Browser Not Found
**Error message:** "Chrome not found"

**Solution:**
- Chrome is pre-installed on ubuntu-latest runners
- If missing, add installation step:
  ```yaml
  - run: |
      wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
      sudo apt-get update
      sudo apt-get install -y google-chrome-stable
  ```

---

## Artifact Upload Issues

### Symptom
Artifacts fail to upload or are empty.

### Common Causes

#### 1. Path Not Found
**Error message:** "Path does not exist"

**Solution:**
1. Verify path exists before upload:
   ```yaml
   - run: ls -la redcap_cypress/cypress/videos/
   ```
2. Check for typos in path
3. Use `if-no-files-found: warn` to make it non-fatal:
   ```yaml
   - uses: actions/upload-artifact@v4
     with:
       name: cypress-videos
       path: redcap_cypress/cypress/videos/
       if-no-files-found: warn
   ```

#### 2. Videos Disabled
**Symptoms:** No videos are generated

**Solution:**
1. Check cypress.config.js:
   ```js
   video: false  // Change to true
   ```
2. Or override in command:
   ```bash
   npx cypress run --config video=true
   ```

#### 3. Artifact Size Limit Exceeded
**Error message:** "Artifact size exceeds limit"

**Solution:**
1. GitHub artifact limit: 500MB per artifact
2. Reduce retention days (less storage, same upload):
   ```yaml
   retention-days: 7  # Instead of 30
   ```
3. Compress videos:
   ```yaml
   - run: tar -czf videos.tar.gz redcap_cypress/cypress/videos/
   - uses: actions/upload-artifact@v4
     with:
       name: cypress-videos
       path: videos.tar.gz
   ```

#### 4. Upload Timing Issues
**Symptoms:** Artifacts upload before tests complete

**Solution:**
- Use `if: always()` to ensure upload runs even if tests fail
- Artifacts are uploaded at end of job by default

---

## Permission Denied Errors

### Symptom
"Permission denied" errors when accessing files/directories.

### Common Causes

#### 1. Docker Volume Permissions
**Error message:** "Permission denied: /var/www/html/edocs"

**Solution:**
1. Set permissions before tests:
   ```yaml
   - run: sudo chmod -R 777 redcap_source/edocs
   - run: sudo chmod -R 777 redcap_source/temp
   ```
2. Or set permissions in container:
   ```yaml
   - run: docker exec debian chmod -R 777 /var/www/html/edocs
   ```

#### 2. SSH Key Permissions
**Error message:** "Bad permissions" for SSH key

**Solution:**
```yaml
- run: |
    mkdir -p ~/.ssh
    echo "${{ secrets.REDCAP_SOURCE_SSH_KEY }}" > ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa  # Important!
    chmod 700 ~/.ssh
```

#### 3. Coverage Directory Access
**Error message:** "Cannot write to /tmp/path/coverage"

**Solution:**
```yaml
- run: docker exec debian mkdir -p /tmp/path/coverage && docker exec debian chmod 777 /tmp/path/coverage
```

---

## Database Connection Issues

### Symptom
Cannot connect to MariaDB from Cypress tests.

### Common Causes

#### 1. Wrong Host Name
**Issue:** Using `127.0.0.1` instead of `mariadb`

**Solution:**
```json
{
  "mysql": {
    "host": "mariadb",  // NOT 127.0.0.1
    "port": "3306"      // NOT 3400 (that's external port)
  }
}
```

#### 2. Wrong Port
**Issue:** Using external port (3400) instead of internal port (3306)

**Solution:**
- From host: `127.0.0.1:3400`
- From containers: `mariadb:3306`

#### 3. Database Not Created
**Error message:** "Unknown database 'redcap'"

**Solution:**
1. Check database exists:
   ```yaml
   - run: docker exec mariadb mysql -u root -proot -e "SHOW DATABASES;"
   ```
2. Create database if missing:
   ```yaml
   - run: docker exec mariadb mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS redcap;"
   ```

#### 4. Volume Conflicts
**Error message:** Database corruption or initialization issues

**Solution:**
```yaml
# Clean up old volume
- run: docker volume rm mySQLVolume || true
- run: docker volume create mySQLVolume
```

---

## GHCR Authentication Issues

### Symptom
Cannot push/pull Docker images to/from GHCR.

### Common Causes

#### 1. GITHUB_TOKEN Insufficient Permissions
**Error message:** "denied: permission denied"

**Solution:**
1. Check workflow permissions:
   ```yaml
   permissions:
     packages: write
     contents: read
   ```
2. Settings → Actions → General → Workflow permissions → "Read and write"

#### 2. Package Doesn't Exist Yet
**Error message:** "not found: manifest unknown"

**Solution:**
1. Run Workflow 1 (build-docker-image.yml) first
2. Verify package exists: Repository → Packages tab
3. Check package visibility (private vs public)

#### 3. Wrong Image Name
**Error message:** Image name format incorrect

**Solution:**
- Correct format: `ghcr.io/OWNER/REPO/IMAGE:TAG`
- Example: `ghcr.io/aldefouw/redcap_cypress_docker/redcap-env:latest`
- Lowercase only!

#### 4. Rate Limiting
**Error message:** "Too many requests"

**Solution:**
- GHCR has generous limits (no known public limits)
- If hitting limits, wait a few minutes and retry
- Check GitHub status: https://www.githubstatus.com/

---

## General Debugging Tips

### 1. View Full Logs

```yaml
# Add debug output
- run: set -x  # Enable bash debug mode

# Print environment
- run: env | sort

# Show Docker status
- run: docker ps -a
- run: docker logs debian
- run: docker logs mariadb

# Check file structure
- run: find . -type f -name "*.feature" | head -20
```

### 2. Add Debugging Steps

```yaml
- name: Debug - List files
  run: |
    echo "=== Workspace structure ==="
    ls -la
    echo "=== REDCap source ==="
    ls -la redcap_source/ || echo "redcap_source not found"
    echo "=== Cypress directory ==="
    ls -la redcap_cypress/

- name: Debug - Docker info
  run: |
    docker --version
    docker compose version
    docker images
    docker ps -a
```

### 3. Test Locally with Act

[Act](https://github.com/nektos/act) runs GitHub Actions locally:

```bash
# Install act
brew install act  # macOS
# or: curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Run workflow locally
act push -j cypress-tests -s GITHUB_TOKEN=your_token
```

### 4. Enable Debug Logging

Add repository secrets:
- `ACTIONS_STEP_DEBUG` = `true`
- `ACTIONS_RUNNER_DEBUG` = `true`

This enables verbose logging in workflow runs.

### 5. Use tmate for SSH Access

Add this step to SSH into the runner:

```yaml
- name: Setup tmate session
  uses: mxschmitt/action-tmate@v3
  if: failure()  # Only on failure
```

Connect via SSH to debug interactively.

### 6. Check GitHub Status

If workflows are behaving unexpectedly:
- https://www.githubstatus.com/
- Check for incidents or maintenance

### 7. Compare with CircleCI

If migrating from CircleCI:
1. Compare env variables
2. Check container names
3. Verify file paths
4. Review [CIRCLECI_MIGRATION.md](./CIRCLECI_MIGRATION.md)

---

## Getting Help

### Before Opening an Issue

1. Check this troubleshooting guide
2. Review workflow logs thoroughly
3. Test locally if possible
4. Check GitHub Actions status

### When Opening an Issue

Include:
- Workflow run URL
- Full error message
- Relevant logs (sanitize secrets!)
- Steps to reproduce
- Expected vs actual behavior

### Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Cypress Troubleshooting](https://docs.cypress.io/guides/references/troubleshooting)
- [Docker Documentation](https://docs.docker.com/)
- [GHCR Documentation](https://docs.github.com/en/packages)

---

## Quick Reference

### Useful Commands for Debugging

```yaml
# Check service health
- run: docker exec mariadb mysqladmin ping -u root -proot
- run: curl -k -I https://localhost:8443

# View logs
- run: docker logs debian --tail 100
- run: docker logs mariadb --tail 100

# Test database connection
- run: docker exec mariadb mysql -u root -proot -e "SELECT VERSION();"

# Check file permissions
- run: ls -la redcap_source/
- run: docker exec debian ls -la /var/www/html/

# Verify Cypress config
- run: cat redcap_cypress/cypress.config.js
- run: cat redcap_cypress/cypress.env.json

# Test npm dependencies
- run: npm list --depth=0
  working-directory: redcap_cypress
```

### Common Fix Patterns

| Issue | Quick Fix |
|-------|-----------|
| Permission denied | `sudo chmod -R 777 <directory>` |
| Service timeout | Increase timeout, check logs |
| Auth failed | Verify secrets, check PAT expiry |
| Path not found | Check relative vs absolute paths |
| Config error | Validate YAML syntax |
| Docker error | Check `docker ps -a` and logs |
| Test failure | Check cypress.env.json config |
| Artifact missing | Add `if-no-files-found: warn` |
