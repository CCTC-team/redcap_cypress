#!/usr/bin/env bash
#
# Run the Cypress suite in a CI-consistent Linux container against the local
# all-in-one REDCap container (CCTC_REDCap_Docker must already be up).
#
# This reproduces the GitHub Ubuntu runner's browser environment locally, so
# headless-Chromium-only failures (e.g. eConsent signature/PDF widgets) surface
# here too — giving a minutes-long fix loop instead of a per-CI-run wait.
#
# Why it needs no config file edits:
#   --network host  -> the container shares the Mac's network, so the suite's
#                      baseUrl https://localhost:8443 reaches CCTC_REDCap_Docker
#                      exactly as the CI runner does (and REDCap's stored
#                      base_url matches). The AIO container publishes 8443 on
#                      the host, so host networking reaches it unchanged.
#   docker socket   -> docker_bin/mysql and the cypress.config.js docker-exec
#                      tasks run against $REDCAP_CONTAINER, injected below as
#                      CYPRESS_MYSQL_CONTAINER / CYPRESS_REDCAP_CONTAINER so the
#                      config default (redcap-db/redcap-app) is overridden to the
#                      single AIO container without touching cypress.env.json.
#
# Linux node_modules live in a named volume (not the host's macOS node_modules),
# populated by `npm ci` on first run and reused after.
#
# Usage:
#   ./run.sh --spec "redcap_rsvc/Feature Tests/C/e-Consent framework_24/C.3.24.0105. - eConsent enable.feature"
#   ./run.sh                       # whole suite
#   FORCE_NPM_CI=1 ./run.sh ...    # force a fresh dependency install
#
# Targeting the legacy two-image stack (redcap-app + redcap-db) instead of AIO:
#   REDCAP_CONTAINER=redcap-app MYSQL_CONTAINER=redcap-db ./run.sh ...
set -euo pipefail

IMAGE=cctc-cypress-runner:15.10.0
HERE="$(cd "$(dirname "$0")" && pwd)"
CYPRESS_DIR="$(cd "$HERE/../.." && pwd)"   # .../CCTC_REDCap_Docker/redcap_cypress
CCTC_DIR="$(cd "$CYPRESS_DIR/.." && pwd)"  # .../CCTC_REDCap_Docker
SOCK="$(docker context inspect --format '{{.Endpoints.docker.Host}}' | sed 's#unix://##')"

# The all-in-one container runs REDCap + MariaDB together, so both the HTTP app
# and the DB/file docker-exec target are the same container. Override both for a
# multi-container stack (e.g. REDCAP_CONTAINER=redcap-app MYSQL_CONTAINER=redcap-db).
REDCAP_CONTAINER="${REDCAP_CONTAINER:-CCTC_REDCap_Docker}"
MYSQL_CONTAINER="${MYSQL_CONTAINER:-$REDCAP_CONTAINER}"

if ! docker ps --format '{{.Names}}' | grep -q "^${REDCAP_CONTAINER}$"; then
  echo "ERROR: $REDCAP_CONTAINER is not running. Start the AIO stack first:" >&2
  echo "  (cd $CCTC_DIR/redcap_docker_aio && docker compose up -d)" >&2
  exit 1
fi

echo "== building $IMAGE (native arch) =="
docker build -t "$IMAGE" "$HERE"

echo "== running cypress (browser=${RUNNER_BROWSER:-chromium}, network=host, redcap=$REDCAP_CONTAINER, mysql=$MYSQL_CONTAINER, socket=$SOCK) =="
docker run --rm \
  --network host \
  --shm-size=2g \
  -v "$SOCK":/var/run/docker.sock \
  -v "$CCTC_DIR":/work \
  -v cctc_cypress_node_modules:/work/redcap_cypress/node_modules \
  -w /work/redcap_cypress \
  -e FORCE_NPM_CI="${FORCE_NPM_CI:-0}" \
  -e RUNNER_BROWSER="${RUNNER_BROWSER:-chromium}" \
  -e CYPRESS_REDCAP_CONTAINER="$REDCAP_CONTAINER" \
  -e CYPRESS_MYSQL_CONTAINER="$MYSQL_CONTAINER" \
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
