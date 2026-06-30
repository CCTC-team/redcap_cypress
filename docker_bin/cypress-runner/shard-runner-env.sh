#!/usr/bin/env bash
# Build the per-shard env that points one Cypress runner at shard k's isolated
# REDCap stack. Sourced by run-ci.sh's parallel mode.
#
#   shard_runner_env <k>   # prints one KEY=VALUE per line:
#     CYPRESS_baseUrl=https://localhost:<shard https port>
#     MAILHOG_URL=http://localhost:<shard mailhog ui port>
#     CYPRESS_MYSQL_CONTAINER=cctc-shard-<k>-db
#
# The caller turns each line into a `docker run -e KEY=VALUE` flag. Port numbers
# come from redcap_docker/shard-env.sh so the offset math lives in exactly one
# place (the runner and the stack can never drift). None of the values contain
# spaces, so plain line-splitting is safe.
#
# Requires CCTC_DIR to point at the CCTC_REDCap_Docker checkout (run-ci.sh sets
# it). The source happens in a subshell so shard-env.sh's exports don't leak
# into the orchestrator's environment.

shard_runner_env() {
  local k="${1:?shard index required (e.g. shard_runner_env 2)}"
  local shard_env="${CCTC_DIR:?CCTC_DIR must be set}/redcap_docker/shard-env.sh"

  if [ ! -f "$shard_env" ]; then
    echo "shard-runner-env.sh: cannot find $shard_env" >&2
    return 1
  fi

  (
    # shellcheck source=/dev/null
    source "$shard_env" "$k" || exit 1
    printf '%s\n' \
      "CYPRESS_baseUrl=https://localhost:${REDCAP_HTTPS_PORT}" \
      "MAILHOG_URL=http://localhost:${MAILHOG_UI_PORT}" \
      "CYPRESS_MYSQL_CONTAINER=${SHARD_PROJECT}-db"
  )
}
