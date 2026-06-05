# redcap-stat-validators image

A small Debian image bundling the statistical engines used to **syntax-validate**
REDCap's "statistical software" data exports in feature `D.21.700`:

| Engine | Validates | How |
|---|---|---|
| **R** (`Rscript`) | `.r` import script | `parse()` — checks syntax without executing |
| **PSPP** (`pspp`) | `.sps` SPSS syntax file | runs the syntax; data-load step tolerated (see below) |

## Why a container?

- **PSPP is no longer on Homebrew**, so it can't be installed on macOS dev boxes the
  normal way. A container gives identical behavior on macOS and the Ubuntu CI runner
  with **no host install**.
- The validator pipes the file to the engine via **stdin** (no bind mount), avoiding
  Docker Desktop's macOS file-sharing restrictions (it doesn't share `/tmp`).

## Build

```bash
npm run validators:build      # docker build -t redcap-stat-validators docker_bin/stat-validators
```

The `validateFileFormat` Cypress task (`cypress.config.js`) also **builds it lazily**
on first use if missing. Pre-building avoids a ~25 s cold build during a test run — in
CI, run `npm run validators:build` once after installing dependencies.

## Behaviour notes

- **R**: `Rscript` parses the file (`parse()`, no execution). Exit 0 = valid; exit 1 =
  syntax error → reported invalid.
- **PSPP**: validated against the **companion data CSV** that REDCap exports next to the
  `.sps` — the task bind-mounts the downloads folder read-only at `/data` so PSPP reads the
  real data and validates the *entire* script (variable definitions, labels, value labels),
  not just the leading commands. Exit 0 = clean; exit 1 = errors found. Data-type
  mismatches surface as **warnings** (ignored); only `error:` lines fail validation.

  REDCap targets **SPSS proper**, and PSPP (an SPSS clone) rejects two fixed template
  idioms, so the task normalizes them before validating — they are boilerplate, not project
  content:

  | REDCap emits | PSPP needs | Why |
  |---|---|---|
  | `FILE HANDLE h NAME='..' LRECL=n.` | `/NAME=.. /LRECL=n` | PSPP requires `/` before subcommands |
  | `SET LOCALE=en_us.` | quoted + valid glibc locale | `en_us` isn't a glibc locale name |

  These are normalized (slashes added; `SET LOCALE` turned into a comment). Everything
  project-specific is validated as-is. If the companion CSV is missing, PSPP's
  `Could not open … as a data file` error is tolerated (degraded check).
- **SAS / Stata** have no free engine and are not in this image — they remain
  smoke-tested in the task.
