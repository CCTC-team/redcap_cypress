# CI-consistent Cypress runner (native-arch, fast).
#
# Runs the suite in a Linux container against the REDCap Docker stack already on
# the host, closing the local-vs-CI gap. macOS host Chrome hides timing/focus
# races in the eConsent PDF-iframe flow that a Linux browser surfaces.
#
# Browser = native Chromium (Debian's `chromium` package — the arm64 base is
# Debian, which ships a real chromium binary, not Ubuntu's broken snap stub). It
# runs natively on Apple Silicon (no emulation) and, being chromium-family (not
# electron), receives the stability flags from cypress.config.js's
# before:browser:launch (--disable-gpu/--no-sandbox/--disable-dev-shm-usage) —
# unlike Electron, which the config skips and which crashed on this PDF-heavy
# flow. Same Blink engine + PDF.js path as CI's Chrome; we trade CI's exact
# amd64 Chrome build for native speed, since the eConsent failures are
# timing/focus races, not engine-rendering differences. (An amd64 +
# google-chrome variant is in this file's git history for byte-exact fidelity.)
FROM cypress/included:15.10.0

# chromium: native browser (see above).
# python3: docker_bin/mysql reads mysql.docker_container from cypress.env.json with it.
# libxml2-utils: provides xmllint, which the cypress.config.js validateFileFormat task
#   runs via execSync to check XML well-formedness and ODM-1.3.1 schema conformance
#   (e.g. D.21.700). Unlike the R/SPSS checks (which degrade to a smoke-test when their
#   Docker validator image is absent), the XML check has no fallback, so xmllint must be
#   present in the runner image itself — CI's GitHub Ubuntu runner already ships it.
# docker CLI (static aarch64 binary): docker_bin/mysql and the cypress.config.js
#   tasks (clearFileRepo, fetchLatestDownloadLocal, validateFileFormat) run
#   `docker exec`/`docker cp` against the redcap-* containers via the mounted host
#   socket. The static binary only needs the socket — no daemon — and is more
#   reliable than the docker.io apt package.
# DOCKER_ARCH maps Debian's arch name to the docker static-binary arch so this
# image builds multi-arch: arm64 for local Apple Silicon, amd64 for the GitHub
# CI runner. (Previously hardcoded aarch64, which broke an amd64 build.)
RUN apt-get update \
 && apt-get install -y --no-install-recommends chromium python3 curl ca-certificates libxml2-utils \
 && ARCH="$(dpkg --print-architecture)" \
 && case "$ARCH" in \
      arm64) DOCKER_ARCH=aarch64 ;; \
      amd64) DOCKER_ARCH=x86_64 ;; \
      *) echo "unsupported arch: $ARCH" >&2; exit 1 ;; \
    esac \
 && curl -fsSL "https://download.docker.com/linux/static/stable/${DOCKER_ARCH}/docker-27.3.1.tgz" \
      | tar -xz -C /tmp \
 && mv /tmp/docker/docker /usr/local/bin/docker \
 && rm -rf /tmp/docker \
 && rm -rf /var/lib/apt/lists/*

# cypress/included sets ENTRYPOINT to `cypress run`; clear it so the wrapper can
# run `npm ci` then `cypress run` in one shell.
ENTRYPOINT []
WORKDIR /work/redcap_cypress
