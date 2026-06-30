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
# Two modes:
#   * SEQUENTIAL (default): shards run one at a time against your already-running
#     primary stack (redcap-app). Simple and light; the retry wrapper + correct
#     per-shard spec set is what reproduces pass/fail. Parallelism is only CI's
#     speed trick, so single-shard mode targets one shard fast.
#   * PARALLEL=1: reproduces CI's fan-out — each shard gets its OWN isolated
#     REDCap stack (cctc-shard-<k> on offset ports, via redcap_docker/
#     shard-stack.sh) and its own runner, all at once. shard-runner-env.sh points
#     each runner at its stack (baseUrl + CYPRESS_MYSQL_CONTAINER), and each
#     shard's cypress/results is overlaid with a private dir so the shards don't
#     race in the shared bind mount. Stacks are torn down on exit. This NEVER
#     touches your primary stack. Heavier (N MariaDB + N Apache at once).
#
# Differences from CI (unavoidable locally, and why they don't hurt repro):
#   * Browser is chromium (the container ships it) vs CI's chrome — same Blink +
#     PDF.js engine, so timing/focus failures still reproduce.
#   * Spec set is CORE-ONLY (redcap_rsvc A-D + cypress/features), matching CI's
#     redcap_cypress clone which has no EM modules. Your local redcap_source/
#     modules would otherwise add ~183 EM specs and shift the slicing. Set
#     INCLUDE_MODULES=1 to use the real scripts/list-specs.js instead.
#
# Usage (from the redcap_cypress directory):
#   ./docker_bin/cypress-runner/run-ci.sh            # all 4 shards, sequential
#   ./docker_bin/cypress-runner/run-ci.sh 3          # only shard 3
#   ./docker_bin/cypress-runner/run-ci.sh 2 4        # shards 2 and 4
#   PARALLEL=1 ./docker_bin/cypress-runner/run-ci.sh # all 4 shards, isolated stacks
#   PARALLEL=1 ./docker_bin/cypress-runner/run-ci.sh 2 4  # shards 2 & 4 in parallel
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
PARALLEL="${PARALLEL:-0}"
SHARDS="${*:-}"                     # e.g. "3" or "2 4"; empty => all 1..SHARD_TOTAL
if [ -z "$SHARDS" ]; then
  SHARDS="$(seq 1 "$SHARD_TOTAL" | tr '\n' ' ')"
fi

echo "== building $IMAGE (native arch) =="
docker build -t "$IMAGE" "$HERE"

# Install deps into the shared node_modules volume so parallel runners (which all
# read the same volume) don't race a concurrent `npm ci`. No-op if deps present.
ensure_deps() {
  echo "== ensuring deps (npm ci into shared volume) =="
  docker run --rm \
    -v "$CCTC_DIR":/work \
    -v cctc_cypress_node_modules:/work/redcap_cypress/node_modules \
    -w /work/redcap_cypress \
    -e FORCE_NPM_CI="${FORCE_NPM_CI:-0}" \
    "$IMAGE" \
    bash -c 'if [ "$FORCE_NPM_CI" = "1" ] || [ ! -d node_modules/rctf ]; then npm ci; else echo "deps present"; fi'
}

run_sequential() {
  if ! docker ps --format '{{.Names}}' | grep -q '^redcap-app$'; then
    echo "ERROR: redcap-app is not running. Start the stack first:" >&2
    echo "  (cd $CCTC_DIR/redcap_docker && docker compose up -d)" >&2
    echo "  (or use PARALLEL=1 to spin up isolated per-shard stacks)" >&2
    exit 1
  fi

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
}

run_parallel() {
  # shard_runner_env <k> prints this shard's runner env (baseUrl, MailHog URL,
  # CYPRESS_MYSQL_CONTAINER). CCTC_DIR tells it where shard-env.sh lives.
  export CCTC_DIR
  # shellcheck source=shard-runner-env.sh
  source "$HERE/shard-runner-env.sh"

  ensure_deps

  local logdir="$CYPRESS_DIR/.shard-logs"
  mkdir -p "$logdir"

  STARTED=""   # shards whose stack is up, for teardown (kept simple for bash 3.2)
  teardown() {
    echo "== tearing down shard stacks =="
    local s
    for s in $STARTED; do
      "$CCTC_DIR/redcap_docker/shard-stack.sh" down "$s" || true
    done
  }
  trap teardown EXIT

  # Lockstep indexed arrays (no `declare -A`, so this runs under macOS bash 3.2).
  local pids=() pshards=()
  local S
  for S in $SHARDS; do
    echo "== bringing up isolated stack for shard $S =="
    "$CCTC_DIR/redcap_docker/shard-stack.sh" up "$S"
    STARTED="$STARTED $S"

    # Per-shard runner env -> -e flags.
    local env_args=() line
    while IFS= read -r line; do
      [ -n "$line" ] && env_args+=(-e "$line")
    done < <(shard_runner_env "$S")

    # Private cypress/results so parallel shards don't race renameReports() etc.
    # in the shared bind mount. Each shard's reports land here on the host.
    local res="$CYPRESS_DIR/.shards/$S/results"
    mkdir -p "$res/json"

    echo "== launching runner for shard $S (log: $logdir/shard-$S.log) =="
    docker run --rm \
      --network host \
      --shm-size=2g \
      -v "$SOCK":/var/run/docker.sock \
      -v "$CCTC_DIR":/work \
      -v cctc_cypress_node_modules:/work/redcap_cypress/node_modules \
      -v "$res":/work/redcap_cypress/cypress/results \
      -w /work/redcap_cypress \
      -e UID="$(id -u)" \
      "${env_args[@]}" \
      -e INCLUDE_MODULES="${INCLUDE_MODULES:-0}" \
      -e SHARD_S="$S" \
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
        if [ "$INCLUDE_MODULES" = "1" ]; then
          LISTER="scripts/list-specs.js"
        else
          LISTER="docker_bin/cypress-runner/list-core-specs.js"
        fi
        # Unique spec file per shard so concurrent runners do not clobber it.
        SPECF="shard-specs-$SHARD_S.txt"
        SHARD_INDEX=$SHARD_S SHARD_TOTAL=$SHARD_TOTAL node "$LISTER" "$SPECF"
        echo "--- shard $SHARD_S specs ---"; cat "$SPECF"
        if [ ! -s "$SPECF" ] || [ "$(tr -d "[:space:]" < "$SPECF")" = "" ]; then
          echo "shard $SHARD_S: no specs, skipping"; exit 0
        fi
        SHARD_INDEX=$SHARD_S SHARD_TOTAL=$SHARD_TOTAL CYPRESS_GROUP_PREFIX="shard-$SHARD_S" \
          npm run test:retry-failed -- --spec-file "$SPECF"
      ' > "$logdir/shard-$S.log" 2>&1 &

    pids+=("$!")
    pshards+=("$S")
  done

  echo "== ${#pids[@]} shard(s) running in parallel; waiting... (tail -f $logdir/shard-*.log) =="
  local OVERALL=0 i
  for i in "${!pids[@]}"; do
    if wait "${pids[$i]}"; then
      echo "shard ${pshards[$i]}: PASS"
    else
      echo "shard ${pshards[$i]}: FAIL (see $logdir/shard-${pshards[$i]}.log)"
      OVERALL=1
    fi
  done

  echo ""
  echo "================== ALL PARALLEL SHARDS DONE (overall=$OVERALL) =================="
  echo "Per-shard results: $CYPRESS_DIR/.shards/<k>/results   logs: $logdir/shard-<k>.log"
  exit $OVERALL
}

if [ "$PARALLEL" = "1" ]; then
  run_parallel
else
  run_sequential
fi
