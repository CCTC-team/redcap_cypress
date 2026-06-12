#!/usr/bin/env bash
#
# Run the Cypress suite in a CI-consistent Linux container against the local
# REDCap Docker stack (redcap-app/redcap-db/redcap-mailhog must already be up).
#
# This reproduces the GitHub Ubuntu runner's browser environment locally, so
# headless-Chrome-only failures (e.g. eConsent signature/PDF widgets) surface
# here too — giving a minutes-long fix loop instead of a per-CI-run wait.
#
# Why it needs no config overrides:
#   --network host  -> the container shares the Mac's network, so the suite's
#                      baseUrl https://localhost:8443 reaches redcap-app exactly
#                      as the CI runner does (and REDCap's stored base_url matches).
#   docker socket   -> docker_bin/mysql (`docker exec -i redcap-db mysql`) and the
#                      cypress.config.js docker-exec tasks work unchanged.
#
# Linux node_modules live in a named volume (not the host's macOS node_modules),
# populated by `npm ci` on first run and reused after.
#
# Usage:
#   ./run.sh --spec "redcap_rsvc/Feature Tests/C/e-Consent framework_24/C.3.24.0105. - eConsent enable.feature"
#   ./run.sh                       # whole suite
#   FORCE_NPM_CI=1 ./run.sh ...    # force a fresh dependency install
set -euo pipefail

IMAGE=cctc-cypress-runner:15.10.0
HERE="$(cd "$(dirname "$0")" && pwd)"
CYPRESS_DIR="$(cd "$HERE/../.." && pwd)"   # .../CCTC_REDCap_Docker/redcap_cypress
CCTC_DIR="$(cd "$CYPRESS_DIR/.." && pwd)"  # .../CCTC_REDCap_Docker
SOCK="$(docker context inspect --format '{{.Endpoints.docker.Host}}' | sed 's#unix://##')"

if ! docker ps --format '{{.Names}}' | grep -q '^redcap-app$'; then
  echo "ERROR: redcap-app is not running. Start the stack first:" >&2
  echo "  (cd $CCTC_DIR/redcap_docker && docker compose up -d)" >&2
  exit 1
fi

echo "== building $IMAGE (native arch) =="
docker build -t "$IMAGE" "$HERE"

echo "== running cypress (browser=${RUNNER_BROWSER:-chromium}, network=host, socket=$SOCK) =="
docker run --rm \
  --network host \
  --shm-size=2g \
  -v "$SOCK":/var/run/docker.sock \
  -v "$CCTC_DIR":/work \
  -v cctc_cypress_node_modules:/work/redcap_cypress/node_modules \
  -w /work/redcap_cypress \
  -e FORCE_NPM_CI="${FORCE_NPM_CI:-0}" \
  -e RUNNER_BROWSER="${RUNNER_BROWSER:-chromium}" \
  "$IMAGE" \
  bash -c '
    set -e
    if [ "$FORCE_NPM_CI" = "1" ] || [ ! -d node_modules/rctf ]; then
      echo "== npm ci (Linux deps) =="
      npm ci
    fi
    echo "== cypress run (--browser $RUNNER_BROWSER) =="
    cypress run --browser "$RUNNER_BROWSER" "$@"
  ' bash "$@"
