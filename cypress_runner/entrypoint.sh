#!/bin/bash
# Wait for the REDCap container to answer, run the Cypress suite, then build a
# report. Extra args are passed straight through to `cypress run` (e.g. --spec).
set -e

BASE_URL="${CYPRESS_baseUrl:-https://localhost:8443}"
BROWSER="${RUNNER_BROWSER:-chromium}"

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
cypress run --browser "${BROWSER}" "$@"
RUN_EXIT=$?
set -e

echo "[runner] generating report..."
npm run report || true

echo "[runner] done (cypress exit ${RUN_EXIT})."
exit "${RUN_EXIT}"
