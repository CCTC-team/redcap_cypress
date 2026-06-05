# Lightweight image bundling the statistical engines used to syntax-validate
# REDCap's "statistical software" data exports in feature D.21.700:
#   - R     (Rscript)  -> validates the .r import script
#   - PSPP  (pspp)     -> validates the .sps SPSS syntax file
#
# Built/used by the `validateFileFormat` Cypress task (cypress.config.js). Using a
# container keeps validation identical on macOS dev boxes and the Ubuntu CI runner
# without installing either engine on the host (PSPP is no longer on Homebrew).
#
# Build: docker build -t redcap-stat-validators docker_bin/stat-validators
FROM debian:stable-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      r-base-core \
      pspp \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Sanity: fail the build if either engine is missing.
RUN Rscript --version && pspp --version

WORKDIR /data
