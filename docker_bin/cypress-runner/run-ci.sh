#!/usr/bin/env bash
#
# Emulate the GitHub `cypress-tests.yml` workflow locally, faithfully.
#
# Unlike run.sh (which does a plain `cypress run` over whatever --spec you pass),
# this reproduces what a push actually runs:
#   * shards the spec set via SHARD_INDEX/SHARD_TOTAL (list-specs slicing), and
#   * runs each shard through `npm run test:retry-failed` — the SAME wrapper CI
#     uses, which reruns failed specs up to CYPRESS_MAX_ATTEMPTS times and has the
#     stall watchdog — with the SAME CYPRESS_* env CI sets.
#
# Differences from CI (unavoidable locally, and why they don't hurt repro):
#   * Browser is chromium (the container ships it) vs CI's chrome — same Blink +
#     PDF.js engine, so timing/focus failures still reproduce.
#   * Shards run SEQUENTIALLY against the one local REDCap stack. CI runs the 4
#     shards in PARALLEL, each on its own isolated stack. Parallel local shards
#     would collide on shared REDCap state, so we serialise. The retry wrapper +
#     correct per-shard spec set is what reproduces pass/fail; parallelism is only
#     CI's speed trick. Use single-shard mode (below) to target one shard fast.
#   * Spec set is CORE-ONLY (redcap_rsvc A-D + cypress/features), matching CI's
#     redcap_cypress clone which has no EM modules. Your local redcap_source/
#     modules would otherwise add ~183 EM specs and shift the slicing. Set
#     INCLUDE_MODULES=1 to use the real scripts/list-specs.js instead.
#
# Usage (from the redcap_cypress directory):
#   ./docker_bin/cypress-runner/run-ci.sh            # all 4 shards, sequential
#   ./docker_bin/cypress-runner/run-ci.sh 3          # only shard 3
#   ./docker_bin/cypress-runner/run-ci.sh 2 4        # shards 2 and 4
#   SHARD_TOTAL=4 ./docker_bin/cypress-runner/run-ci.sh   # override shard count
#   FORCE_NPM_CI=1 ./docker_bin/cypress-runner/run-ci.sh  # fresh dep install
#   INCLUDE_MODULES=1 ./docker_bin/cypress-runner/run-ci.sh  # include EM specs
set -euo pipefail

IMAGE=cctc-cypress-runner:15.10.0
HERE="$(cd "$(dirname "$0")" && pwd)"
CYPRESS_DIR="$(cd "$HERE/../.." && pwd)"   # .../CCTC_REDCap_Docker/redcap_cypress
CCTC_DIR="$(cd "$CYPRESS_DIR/.." && pwd)"  # .../CCTC_REDCap_Docker
SOCK="$(docker context inspect --format '{{.Endpoints.docker.Host}}' | sed 's#unix://##')"

SHARD_TOTAL="${SHARD_TOTAL:-4}"
SHARDS="${*:-}"                     # e.g. "3" or "2 4"; empty => all 1..SHARD_TOTAL
if [ -z "$SHARDS" ]; then
  SHARDS="$(seq 1 "$SHARD_TOTAL" | tr '\n' ' ')"
fi

if ! docker ps --format '{{.Names}}' | grep -q '^redcap-app$'; then
  echo "ERROR: redcap-app is not running. Start the stack first:" >&2
  echo "  (cd $CCTC_DIR/redcap_docker && docker compose up -d)" >&2
  exit 1
fi

echo "== building $IMAGE (native arch) =="
docker build -t "$IMAGE" "$HERE"

echo "== emulating CI: shards [$SHARDS] of $SHARD_TOTAL, sequential, retry wrapper (chromium) =="
docker run --rm \
  --network host \
  --shm-size=2g \
  -v "$SOCK":/var/run/docker.sock \
  -v "$CCTC_DIR":/work \
  -v cctc_cypress_node_modules:/work/redcap_cypress/node_modules \
  -w /work/redcap_cypress \
  -e FORCE_NPM_CI="${FORCE_NPM_CI:-0}" \
  -e INCLUDE_MODULES="${INCLUDE_MODULES:-0}" \
  -e SHARDS="$SHARDS" \
  -e SHARD_TOTAL="$SHARD_TOTAL" \
  -e CYPRESS_BROWSER=chromium \
  -e CYPRESS_MAX_ATTEMPTS=3 \
  -e CYPRESS_DISABLE_RECORDING=1 \
  -e CYPRESS_STALL_MS=1800000 \
  -e CYPRESS_prettyEnabled=true \
  "$IMAGE" \
  bash -c '
    set -e
    export UID
    if [ "$FORCE_NPM_CI" = "1" ] || [ ! -d node_modules/rctf ]; then
      echo "== npm ci (Linux deps) =="
      npm ci
    fi
    if [ "$INCLUDE_MODULES" = "1" ]; then
      LISTER="scripts/list-specs.js"
    else
      LISTER="docker_bin/cypress-runner/list-core-specs.js"
    fi
    OVERALL=0
    for S in $SHARDS; do
      echo ""
      echo "================== SHARD $S / $SHARD_TOTAL =================="
      SHARD_INDEX=$S SHARD_TOTAL=$SHARD_TOTAL node "$LISTER" shard-specs.txt
      echo "--- shard $S specs ---"; cat shard-specs.txt
      if [ ! -s shard-specs.txt ] || [ "$(tr -d "[:space:]" < shard-specs.txt)" = "" ]; then
        echo "shard $S: no specs, skipping"; continue
      fi
      SHARD_INDEX=$S SHARD_TOTAL=$SHARD_TOTAL CYPRESS_GROUP_PREFIX="shard-$S" \
        npm run test:retry-failed -- --spec-file shard-specs.txt || { echo "shard $S finished with failures"; OVERALL=1; }
    done
    echo ""
    echo "================== ALL SHARDS DONE (overall=$OVERALL) =================="
    exit $OVERALL
  '
