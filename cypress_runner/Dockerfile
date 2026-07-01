# Cypress runner image (Image B) with redcap_rsvc + rctf BAKED IN.
#
# Runs the REDCap Cypress suite against an already-running all-in-one REDCap
# container (CCTC_REDCap_Docker). The test framework reaches REDCap's DB and
# files via `docker exec`/`docker cp`, so this container mounts the host Docker
# socket and ships a docker CLI; HTTP is reached over the host network.
#
# Build context = the redcap_cypress/ suite itself (this folder lives inside it);
# cypress_runner/Dockerfile.dockerignore trims node_modules/.git/results/etc.
# rctf and redcap_rsvc are private GitHub deps pulled by `npm ci` over SSH at
# build time, which needs BuildKit SSH forwarding:  docker compose build --ssh default
FROM cypress/included:15.10.0

# chromium  : native browser the suite runs in (cypress.config.js applies its
#             stability flags to chromium-family browsers).
# python3   : docker_bin/mysql reads mysql.docker_container from cypress.env.json.
# libxml2-utils (xmllint): cypress.config.js validateFileFormat XML/ODM check.
# git/openssh-client: npm ci clones the private rctf/redcap_rsvc git deps.
# docker CLI (static, arch-aware): docker_bin/mysql + cypress.config.js tasks run
#             `docker exec`/`docker cp` against the REDCap container via the socket.
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      chromium python3 git openssh-client curl ca-certificates libxml2-utils \
 && ARCH="$(dpkg --print-architecture)" \
 && case "$ARCH" in \
      arm64) DOCKER_ARCH=aarch64 ;; \
      amd64) DOCKER_ARCH=x86_64 ;; \
      *) echo "unsupported arch: $ARCH" >&2; exit 1 ;; \
    esac \
 && curl -fsSL "https://download.docker.com/linux/static/stable/${DOCKER_ARCH}/docker-27.3.1.tgz" \
      | tar -xz -C /tmp \
 && mv /tmp/docker/docker /usr/local/bin/docker \
 && rm -rf /tmp/docker /var/lib/apt/lists/*

WORKDIR /work/redcap_cypress

# Bake the suite tree (context = redcap_cypress/ itself; Dockerfile.dockerignore
# trims node_modules/.git/results/etc). This also copies cypress_runner/ under
# /work/redcap_cypress/cypress_runner — harmless (unused at runtime).
COPY . /work/redcap_cypress

# The DB/file tasks hardcode the 'redcap-app' container name. Make it overridable
# so this image can target the all-in-one container (CCTC_REDCap_Docker) without
# editing the source repo; default is unchanged so CI keeps working.
RUN sed -i "s/const container = 'redcap-app'/const container = process.env.CYPRESS_REDCAP_CONTAINER || 'redcap-app'/g" cypress.config.js

# Install Linux-native deps and clone the private git deps over forwarded SSH,
# then run the suite's prep: move redcap_rsvc out of node_modules and copy its
# fixtures into cypress/fixtures (the redcap_rsvc Feature Tests are the specs;
# rctf:get_step_features is NOT run -- it's only for rctf's own self-tests).
# Use `npm ci` (never redcap_rsvc:install/clean, which deletes package-lock.json
# and triggers the esbuild crash).
RUN --mount=type=ssh \
    mkdir -p -m 0700 /root/.ssh \
 && ssh-keyscan -t ed25519,rsa github.com >> /root/.ssh/known_hosts 2>/dev/null \
 && npm ci \
 && npm run redcap_rsvc:move_files

# Defaults: target the all-in-one REDCap container + its HTTPS base URL.
ENV CYPRESS_baseUrl=https://localhost:8443 \
    CYPRESS_MYSQL_CONTAINER=CCTC_REDCap_Docker \
    CYPRESS_REDCAP_CONTAINER=CCTC_REDCap_Docker \
    RUNNER_BROWSER=chromium

COPY --chmod=0755 cypress_runner/entrypoint.sh /usr/local/bin/entrypoint.sh
# cypress/included sets ENTRYPOINT to `cypress run`; our wrapper drives instead.
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
