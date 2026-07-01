#!/bin/bash
# Wait for the REDCap container to answer, run the Cypress suite, then build a
# report. Extra args are passed straight through to `cypress run` (e.g. --spec).
set -e

BASE_URL="${CYPRESS_baseUrl:-https://localhost:8443}"
BROWSER="${RUNNER_BROWSER:-chromium}"
# rerun-failed.js (test:retry-failed) reads the browser from CYPRESS_BROWSER.
export CYPRESS_BROWSER="${BROWSER}"

echo "[runner] target REDCap: ${BASE_URL}"
echo "[runner] DB/file container: ${CYPRESS_MYSQL_CONTAINER:-redcap-db}"

# Fail fast if the Docker socket / REDCap container isn't reachable -- the suite
# drives the DB through `docker exec`, so this must work before we start.
if ! docker exec "${CYPRESS_MYSQL_CONTAINER:-CCTC_REDCap_Docker}" true 2>/dev/null; then
    echo "[runner] ERROR: cannot 'docker exec ${CYPRESS_MYSQL_CONTAINER:-CCTC_REDCap_Docker}'." >&2
    echo "[runner] Is the REDCap container running and the Docker socket mounted?" >&2
    exit 1
fi

# rctf's populateStructureAndData reads REDCap's install SQL from the local
# filesystem at ${redcap_source_path}/redcap_v<version>/Resources/sql. We don't
# bake redcap_source into this image; instead copy that SQL out of the running
# REDCap container so the runner stays version-decoupled and self-contained.
REDCAP_CONTAINER="${CYPRESS_MYSQL_CONTAINER:-CCTC_REDCap_Docker}"
VER=$(python3 -c "import json;print(json.load(open('cypress.env.json'))['redcap_version'])" 2>/dev/null)
SRC=/work/redcap_source
if [ -n "$VER" ] && [ ! -f "${SRC}/redcap_v${VER}/Resources/sql/install.sql" ]; then
    echo "[runner] fetching REDCap SQL (v${VER}) from ${REDCAP_CONTAINER}..."
    mkdir -p "${SRC}/redcap_v${VER}/Resources"
    docker cp "${REDCAP_CONTAINER}:/var/www/html/redcap_v${VER}/Resources/sql" \
        "${SRC}/redcap_v${VER}/Resources/sql"
fi
export CYPRESS_redcap_source_path="${SRC}"

# Optional: run a specific External Module's own automated_tests (e.g.
# embellish_fields_v1.0.3). The module tree is baked into — or bind-mounted onto —
# the AIO REDCap image, so copy its automated_tests out (exactly like the SQL
# above) into /work/redcap_source/modules/<mod>/ where cypress.config.js's module
# specPattern (../redcap_source/modules/*/automated_tests/**/*.feature) discovers
# them. Keeps the runner version- and module-decoupled: nothing EM-specific is baked.
if [ -n "${EM_MODULE:-}" ]; then
    echo "[runner] fetching automated_tests for module ${EM_MODULE} from ${REDCAP_CONTAINER}..."
    mkdir -p "${SRC}/modules/${EM_MODULE}"
    rm -rf "${SRC}/modules/${EM_MODULE}/automated_tests"
    if ! docker cp "${REDCAP_CONTAINER}:/var/www/html/modules/${EM_MODULE}/automated_tests" \
            "${SRC}/modules/${EM_MODULE}/automated_tests"; then
        echo "[runner] ERROR: module ${EM_MODULE} has no automated_tests in ${REDCAP_CONTAINER}." >&2
        echo "[runner] Is the module present at /var/www/html/modules/${EM_MODULE}?" >&2
        exit 1
    fi

    # An EM may ship its OWN step definitions. The preprocessor already globs them
    # (package.json: ../redcap_source/modules/*/automated_tests/step_definitions/*.js),
    # but that path is OUTSIDE the project tree, so esbuild can't resolve their
    # `require('@badeball/cypress-cucumber-preprocessor')` — Node walks up from the
    # file's dir and never reaches /work/redcap_cypress/node_modules, so the spec
    # fails to bundle. Move them into the in-tree shared step-def dir (also globbed)
    # under a module-prefixed name so the require resolves AND the baked shared steps
    # aren't clobbered; drop the out-of-tree originals so their now-duplicate,
    # unresolvable copies aren't bundled. (Step defs that `require` a sibling file by
    # relative path aren't supported — the current EMs only import the preprocessor.)
    STEPDIR="${SRC}/modules/${EM_MODULE}/automated_tests/step_definitions"
    if ls "${STEPDIR}"/*.js >/dev/null 2>&1; then
        echo "[runner] staging ${EM_MODULE} custom step definitions into cypress/support/step_definitions/..."
        for f in "${STEPDIR}"/*.js; do
            cp "$f" "cypress/support/step_definitions/_em_${EM_MODULE}__$(basename "$f")"
        done
        rm -f "${STEPDIR}"/*.js
    fi
fi

# rctf writes runtime scratch files here (latest_url.info, snapshots, generated
# structure_and_data.sql). The dir is excluded from the image, so ensure it exists.
mkdir -p test_db

echo "[runner] waiting for REDCap to respond..."
ready=0
for _ in $(seq 1 60); do
    code=$(curl -k -s -o /dev/null -w '%{http_code}' "${BASE_URL}/" 2>/dev/null || true)
    if [ "$code" = "200" ] || [ "$code" = "302" ]; then ready=1; break; fi
    sleep 3
done
if [ "$ready" != "1" ]; then
    echo "[runner] ERROR: REDCap did not respond at ${BASE_URL} in time." >&2
    exit 1
fi
echo "[runner] REDCap is up. Running Cypress (browser=${BROWSER})..."

# Clean prior report, run the suite (non-fatal so we always emit a report).
npm run report:clean >/dev/null 2>&1 || true
set +e
if [ -n "${SHARD_INDEX:-}" ] && [ -n "${SHARD_TOTAL:-}" ]; then
    # CI sharded mode: the specs are baked in, so this shard enumerates its own
    # slice (list-specs.js reads SHARD_INDEX/SHARD_TOTAL) and runs it through the
    # retry harness (test:retry-failed = scripts/rerun-failed.js, max attempts via
    # CYPRESS_MAX_ATTEMPTS). No host-prepared workspace needed.
    echo "[runner] shard ${SHARD_INDEX}/${SHARD_TOTAL}: enumerating baked specs..."
    node scripts/list-specs.js shard-specs.txt
    echo "[runner] shard ${SHARD_INDEX}/${SHARD_TOTAL}: running (retries max ${CYPRESS_MAX_ATTEMPTS:-3})..."
    npm run test:retry-failed -- --spec-file shard-specs.txt
    RUN_EXIT=$?
elif [ "$#" -gt 0 ]; then
    # Explicit spec(s) passed through, e.g. --spec "redcap_rsvc/.../X.feature".
    cypress run --browser "${BROWSER}" "$@"
    RUN_EXIT=$?
elif [ -n "${EM_MODULE:-}" ]; then
    # External-module mode: run ONLY that module's automated_tests (excluding the
    # REDUNDANT specs), through the same retry harness the shards use. Spec paths
    # are project-root-relative so they match cypress.config.js's module
    # specPattern and rerun-failed.js's r.spec.relative retry keys.
    echo "[runner] enumerating ${EM_MODULE} specs..."
    find "../redcap_source/modules/${EM_MODULE}/automated_tests" \
        -type f -name '*.feature' ! -iname '*REDUNDANT*' \
        | sort -u > em-specs.txt
    echo "[runner] $(wc -l < em-specs.txt | tr -d ' ') spec(s) for ${EM_MODULE}:"
    cat em-specs.txt
    npm run test:retry-failed -- --spec-file em-specs.txt
    RUN_EXIT=$?
else
    # Whole suite in one process.
    cypress run --browser "${BROWSER}"
    RUN_EXIT=$?
fi
set -e

echo "[runner] generating report..."
npm run report || true

echo "[runner] done (cypress exit ${RUN_EXIT})."
exit "${RUN_EXIT}"
