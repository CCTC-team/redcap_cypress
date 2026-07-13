#!/usr/bin/env bash
#
# run-local.sh — run the Cypress suite locally against the all-in-one (AIO)
# REDCap container the same way CI does, working around three things that make a
# bare `npx cypress run` fail on a developer machine / inside the IDE terminal:
#
#   1. ELECTRON_RUN_AS_NODE — VSCode / Claude Code (both Electron apps) export
#      this into spawned shells, which makes Cypress's own Electron binary boot
#      as plain Node and reject its GUI flags ("bad option: --no-sandbox"). We
#      unset it so Cypress launches normally.
#
#   2. DB container name — docker_bin/mysql / cypress.env.json default to the
#      legacy 3-container stack name (redcap-db). The AIO stack is one container.
#
#   3. App container name — cypress.config.js tasks (clearFileRepo, PDF poll)
#      docker-exec into CYPRESS_REDCAP_CONTAINER, defaulting to redcap-app
#      (also a legacy name). This one has NO cypress.env.json fallback.
#
# Both container names default to the AIO container but can be overridden by
# exporting CYPRESS_REDCAP_CONTAINER / CYPRESS_MYSQL_CONTAINER before running
# (e.g. point at the legacy stack, or a differently-named AIO container).
#
# Usage:
#   scripts/run-local.sh                                  # runs the whole suite
#   scripts/run-local.sh --spec "redcap_rsvc/.../X.feature"
#   scripts/run-local.sh --spec "..." --browser chrome    # any cypress args pass through
#
# Which Cypress subcommand runs is controlled by CYPRESS_CMD (default "run"):
#   CYPRESS_CMD=open scripts/run-local.sh                 # interactive GUI Test Runner
# (npm run open:local is a shortcut for that.)
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."

CONTAINER="${REDCAP_AIO_CONTAINER:-CCTC_REDCap_Docker}"

# Fail early with a clear message if the AIO container isn't up, rather than
# letting every spec's setup hook fail with "No such container".
if [ "$(docker inspect -f '{{.State.Running}}' "$CONTAINER" 2>/dev/null)" != "true" ]; then
  echo "run-local.sh: REDCap AIO container '$CONTAINER' is not running." >&2
  echo "  Start it, or set REDCAP_AIO_CONTAINER to the correct name." >&2
  echo "  Running containers:" >&2
  docker ps --format '    {{.Names}} ({{.Status}})' >&2 || true
  exit 1
fi

exec env -u ELECTRON_RUN_AS_NODE \
  CYPRESS_REDCAP_CONTAINER="${CYPRESS_REDCAP_CONTAINER:-$CONTAINER}" \
  CYPRESS_MYSQL_CONTAINER="${CYPRESS_MYSQL_CONTAINER:-$CONTAINER}" \
  npx cypress "${CYPRESS_CMD:-run}" "$@"
