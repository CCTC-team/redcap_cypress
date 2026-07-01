# Known flaky / failing specs

Specs that fail intermittently or in a context-dependent way when run via the
`cypress_runner/` image against the all-in-one REDCap container. These are
**suite-side** issues (test ordering / timing / environment), not defects in the
Docker setup — recorded here so a failure in a batch run can be triaged quickly.

Add new entries as they're found. Format: spec path, symptom, observations,
classification.

---

## `A/Project Setup_4/A.6.4.0500. - Repeatable Instruments.feature`

- **Test:** `A.6.4.0500.100 User's ability to add or modify repeatable instrument while in production mode`
- **Symptom:** `AssertionError: Timed out retrying after 90000ms: Expected to find element: tr :contains("Repeating instruments and events"), but never found it.`
- **Observations (2026-06-30, AIO + cypress_runner, 4 GB Docker / 8 GB M1 Air):**
  | Context | Result | Duration |
  |---------|--------|----------|
  | Full suite (spec 18, after 17 others) | passed | 4:02 |
  | Category A batch (spec 20, memory-loaded) | failed | 47:19 (thrashing) |
  | Isolated, fresh container | failed | 4:50 (normal speed) |
- **Isolation recheck (2026-07-01, fresh container):** **PASSED** (1 passing, 4:06).
  Contradicts the earlier "fails in isolation" observation → the failure is an
  **intermittent flake**, not strictly order-dependent.
- **Classification:** **flaky (pass-on-retry).** Passes when run after its sibling
  specs, and also passed on an isolated rerun — so failures are intermittent
  (timing), not a hard order dependency.
- **Note:** under memory pressure (large batch on 4 GB) it also *thrashes* — the
  47-min duration above — which is a separate environmental effect on top of the
  real failure.
- **Workaround:** re-run; prefer running within its category/full ordering.

---

## `C/e-Consent framework_24/C.3.24.0505. - eConsent download PDF.feature`

- **Symptom:** `AssertionError: Timed out retrying after 90000ms: Expected to
  find element: table:visible tr:has(:contains(".pdf"))…:contains("e-Consent"):contains("Participant")`,
  but never found it.
- **Observed:** 2026-07-01 B/C/D sweep, chunk 25 — 4 tests, 3 passed, 1 failed,
  duration 2:23 (normal speed, not thrashing).
- **Isolation recheck (2026-07-01, fresh container):** **FAILED again** (3 passing,
  1 failing, 2:07) with the identical PDF-row timeout.
- **Classification:** **consistent in isolation** (failed on both the sweep and the
  isolated rerun) — the e-Consent PDF-snapshot row does not appear within 90 s in
  this AIO environment. Deeper than a one-off race; likely the PDF-iframe
  survey-options path (see `eConsent-flakiness-findings.md`). Needs a spec/timing
  fix, not just a retry.

## `D/Additional Customizations_113/D.113.200 - Data History Popup.feature`

- **Symptom:** `AssertionError: Timed out retrying after 20000ms: Expected to find
  element: table…:contains("Date/Time"):contains("of"):contains("Change")…`, but
  never found it (the data-history popup table).
- **Observed:** 2026-07-01 sweep, chunk 29 — 2 tests, 1 failed + 1 pending,
  duration 0:36.
- **Isolation recheck (2026-07-01, fresh container):** **FAILED again** (0 passing,
  1 failing, 1 pending, 0:35) with the identical history-popup table timeout.
- **Classification:** **consistent in isolation** (failed on both the sweep and the
  isolated rerun) — the data-history popup table does not render within the 20 s
  wait in this AIO environment. Needs a longer wait / spec fix, not just a retry.

## `D/Additional Customizations_113/D.113.300 - Branching Logic Hiding Fields.feature`

- **Symptom:** `CypressError: cy.type() failed because the page updated as a result
  of this command … subject is no longer attached to the DOM`.
- **Observed:** 2026-07-01 sweep, chunk 29 — 1 test, 1 failed, duration 0:15.
- **Isolation recheck (2026-07-01, fresh container):** **PASSED** (1 passing, 0:26).
  Confirms the detached-DOM error is intermittent.
- **Classification:** **flaky (pass-on-retry)** — classic Cypress race: the page
  re-rendered mid-`cy.type()` (detached-DOM). Passed on the isolated rerun; a
  retry/`.should()` re-query in the step would make it deterministic.

## Environmental note: memory pressure on 8 GB / 4 GB Docker

Not a per-spec flake, but the common cause of slow/timeout failures here: on the
8 GB M1 Air with Docker capped at 4 GB, **large batches accumulate memory** and
heavy specs (Project Setup, e-Consent, rights) start thrashing — high CPU, ~10×
slower, and assertion timeouts that look like failures. (A 5 GB Docker bump was
tried and **destabilized the VM** — it couldn't boot, so 4 GB is the ceiling.)

**Mitigation:** run in **small batches (~5–10 specs)**, not whole categories or
the full 248-spec suite, so memory resets between runs.
