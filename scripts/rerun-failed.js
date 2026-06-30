#!/usr/bin/env node
const cypress = require('cypress')
const fs = require('fs')
const path = require('path')

const MAX_ATTEMPTS = parseInt(process.env.CYPRESS_MAX_ATTEMPTS || '3', 10)
const REPORT_DIR = path.join('cypress', 'results', 'json')

function trimSpecPrefix(filename) {
  // "A.2.2.0100. - Create Users_001.json" -> "A.2.2.0100_001.json"
  // "A.2.2.0100. - Create Users.json"     -> "A.2.2.0100.json"
  const m = filename.match(/^(.*?)\s+-\s+.*?(_\d+)?(\.json)$/)
  if (!m) return null
  const prefix = m[1].replace(/\.$/, '')
  return `${prefix}${m[2] || ''}${m[3]}`
}

function renameReports() {
  if (process.env.REPORT_NAME) return
  if (!fs.existsSync(REPORT_DIR)) return
  for (const f of fs.readdirSync(REPORT_DIR)) {
    if (!f.endsWith('.json')) continue
    const renamed = trimSpecPrefix(f)
    if (!renamed || renamed === f) continue
    const src = path.join(REPORT_DIR, f)
    const dst = path.join(REPORT_DIR, renamed)
    if (fs.existsSync(dst)) continue
    fs.renameSync(src, dst)
  }
}

// Before re-running a failed spec, delete its stale per-spec report(s) from the
// prior attempt. The mochawesome reporter runs with `overwrite: false`, so a
// retry would otherwise leave the previous report on disk — either as a `_NNN`
// duplicate or as a second report object concatenated into the same file
// (invalid JSON). Both break `mochawesome-merge` and the HTML report. Removing
// the old report first guarantees the retry writes exactly one clean JSON file
// reflecting the latest attempt.
function reportStemsForSpec(specRel) {
  // mochawesome's `[name]` token is the spec basename sans extension, e.g.
  // "A.2.2.0100. - Create Users". renameReports() later trims that to
  // "A.2.2.0100". Target both forms so we catch the file whether or not a prior
  // attempt already renamed it.
  const base = path.basename(specRel).replace(/\.[^.]+$/, '')
  const stems = new Set([base])
  const trimmed = trimSpecPrefix(`${base}.json`)
  if (trimmed) stems.add(trimmed.replace(/\.json$/, ''))
  return stems
}

function removeReportsForSpecs(specs) {
  if (!fs.existsSync(REPORT_DIR) || !specs || !specs.length) return
  const targets = new Set()
  for (const s of specs) {
    for (const stem of reportStemsForSpec(s)) targets.add(stem)
  }
  for (const f of fs.readdirSync(REPORT_DIR)) {
    if (!f.endsWith('.json')) continue
    // Strip `.json` and any `_NNN` overwrite counter to get the bare stem.
    const stem = f.replace(/\.json$/, '').replace(/_\d+$/, '')
    if (targets.has(stem)) {
      fs.rmSync(path.join(REPORT_DIR, f), { force: true })
    }
  }
}

// Snapshot mtimes of report files before a run so we can identify which
// reports were produced by *this* attempt (vs prior attempts).
function snapshotReportMtimes() {
  if (!fs.existsSync(REPORT_DIR)) return {}
  const out = {}
  for (const f of fs.readdirSync(REPORT_DIR)) {
    if (!f.endsWith('.json')) continue
    out[f] = fs.statSync(path.join(REPORT_DIR, f)).mtimeMs
  }
  return out
}

// Read mochawesome JSONs written/updated since `snapshot` and return the
// relative spec paths that had any failures. Used as a fallback when
// cypress.run() returns status:'failed' due to a known post-run config
// crash but the specs themselves already wrote reports to disk.
function readFailedSpecsFromReports(snapshot) {
  if (!fs.existsSync(REPORT_DIR)) return []
  const failed = []
  for (const f of fs.readdirSync(REPORT_DIR)) {
    if (!f.endsWith('.json')) continue
    const fullPath = path.join(REPORT_DIR, f)
    const mtime = fs.statSync(fullPath).mtimeMs
    const prev = snapshot[f]
    if (prev !== undefined && mtime <= prev) continue // not from this attempt
    let report
    try {
      report = JSON.parse(fs.readFileSync(fullPath, 'utf8'))
    } catch {
      continue
    }
    if (!report.stats || report.stats.failures <= 0) continue
    const fullFile = report.results && report.results[0] && report.results[0].fullFile
    if (!fullFile) continue
    failed.push(path.relative(process.cwd(), fullFile))
  }
  return failed
}

// rctf's afterSpecHandler can throw `Unexpected state in afterSpecHandler`
// *after* all specs have completed and written their reports. Depending on
// how Cypress catches it, this surfaces as one of:
//   1. cypress.run() resolves with {status:'failed', message}
//   2. cypress.run() rejects with an Error
//   3. an unhandled promise rejection emitted by the event loop *after*
//      cypress.run() has already resolved with normal results
// All three are cosmetic — the test results are already on disk.
// (The sibling `'totalFailed' in undefined` crash from a dropped `results`
// arg in after:run was fixed upstream in rctf cctc_v1.0.0, which forwards
// results to afterRunHandler, so it's no longer detected here.)
const POST_RUN_COSMETIC_CRASH = /Unexpected state in afterSpecHandler/

function isCosmeticCrash(err) {
  const text = err && (err.message || err.stack || String(err))
  return !!text && POST_RUN_COSMETIC_CRASH.test(text)
}

// Capture the cosmetic-crash rejection so the await loop in runSpecs()
// can bail out. CI shards 2/3/4 of run 25113450054 showed cypress.run()
// hangs forever (16+ min) when this rejection escapes — Cypress' internal
// resolve chain is left dangling. Just silencing the rejection keeps the
// process alive but doesn't unblock `await cypress.run()`.
let cosmeticCrashSignal = null
process.on('unhandledRejection', (reason) => {
  if (isCosmeticCrash(reason)) {
    cosmeticCrashSignal = reason
    console.warn('Cosmetic post-run rctf/cucumber rejection detected (specs already wrote reports):')
    console.warn(`  ${(reason && (reason.message || String(reason))).split('\n')[0]}`)
    return
  }
  console.error('Unhandled rejection:', reason)
  process.exit(1)
})

// Race cypress.run() against the cosmetic-crash signal so a dangling
// internal promise inside Cypress can't lock us up.
function runWithCosmeticDetection(cypressPromise) {
  cosmeticCrashSignal = null
  let interval
  const cosmeticPromise = new Promise(resolve => {
    interval = setInterval(() => {
      if (cosmeticCrashSignal) resolve({ __cosmetic: cosmeticCrashSignal })
    }, 100)
  })
  return Promise.race([
    cypressPromise.then(v => ({ __value: v }), e => ({ __error: e })),
    cosmeticPromise,
  ]).finally(() => clearInterval(interval))
}

// Watchdog: if no spec report is written for STALL_MS ms, assume Cypress
// is hung (network stall to dashboard, Chrome freeze, etc.) and exit so
// the workflow can move to artifact-upload steps instead of burning the
// 350-min step timeout. Reports for already-completed specs remain on disk.
let watchdogTimer = null
let lastProgressTs = Date.now()

function latestReportMtime() {
  if (!fs.existsSync(REPORT_DIR)) return 0
  let max = 0
  for (const f of fs.readdirSync(REPORT_DIR)) {
    if (!f.endsWith('.json')) continue
    const m = fs.statSync(path.join(REPORT_DIR, f)).mtimeMs
    if (m > max) max = m
  }
  return max
}

function startWatchdog() {
  const stallMs = parseInt(process.env.CYPRESS_STALL_MS || '900000', 10) // 15 min
  if (watchdogTimer) clearInterval(watchdogTimer)
  lastProgressTs = Date.now()
  let lastSeenMtime = latestReportMtime()
  watchdogTimer = setInterval(() => {
    const now = Date.now()
    const m = latestReportMtime()
    if (m > lastSeenMtime) {
      lastSeenMtime = m
      lastProgressTs = now
    }
    if (now - lastProgressTs > stallMs) {
      console.error(`\n=== WATCHDOG: no new spec report for ${Math.round(stallMs/60000)} min — Cypress appears hung. Forcing exit so workflow can proceed to artifact upload. ===`)
      process.exit(2)
    }
  }, 60000).unref() // .unref so it doesn't keep the event loop alive on its own
}

function stopWatchdog() {
  if (watchdogTimer) {
    clearInterval(watchdogTimer)
    watchdogTimer = null
  }
}

function parseArgs(argv) {
  const out = {}
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i]
    if (a === '--spec') out.spec = argv[++i]
    else if (a === '--spec-file') out.specFile = argv[++i]
    else if (a === '--browser') out.browser = argv[++i]
    else if (a === '--config') out.config = argv[++i]
    else if (a === '--env') out.env = argv[++i]
    else if (a === '--config-file') out.configFile = argv[++i]
  }
  return out
}

const cliArgs = parseArgs(process.argv.slice(2))

let initialSpec = null
if (cliArgs.specFile) {
  initialSpec = fs.readFileSync(cliArgs.specFile, 'utf8')
    .split('\n')
    .map(s => s.trim())
    .filter(Boolean)
} else if (cliArgs.spec) {
  initialSpec = cliArgs.spec.split(',')
}

async function runSpecs(specs, attempt) {
  const opts = {
    browser: cliArgs.browser || process.env.CYPRESS_BROWSER || 'chrome',
  }
  if (cliArgs.config) opts.config = cliArgs.config
  if (cliArgs.configFile) opts.configFile = cliArgs.configFile
  if (cliArgs.env) opts.env = cliArgs.env
  if (specs && specs.length) opts.spec = specs

  // Dashboard recording can stall the runner mid-run if the connection
  // to api.cypress.io hangs. Set CYPRESS_DISABLE_RECORDING=1 to bypass.
  if (process.env.CYPRESS_RECORD_KEY && !process.env.CYPRESS_DISABLE_RECORDING) {
    opts.record = true
    opts.key = process.env.CYPRESS_RECORD_KEY
    const groupPrefix = process.env.CYPRESS_GROUP_PREFIX || 'core-tests'
    opts.group = `${groupPrefix}-attempt-${attempt}`
    if (process.env.GITHUB_RUN_ID) {
      const base = `${process.env.GITHUB_RUN_ID}-${process.env.GITHUB_RUN_ATTEMPT || 1}`
      opts.ciBuildId = `${base}-attempt-${attempt}`
    }
  } else if (process.env.CYPRESS_DISABLE_RECORDING) {
    console.log('CYPRESS_DISABLE_RECORDING set — running without --record/--key.')
  }

  // On a retry, drop the failing specs' prior reports so this attempt's reports
  // replace (rather than concatenate with / duplicate) them. Attempt 1 has no
  // prior reports for these specs, so skip the scan.
  if (attempt > 1 && specs && specs.length) removeReportsForSpecs(specs)

  const reportSnapshot = snapshotReportMtimes()

  startWatchdog()
  const outcome = await runWithCosmeticDetection(cypress.run(opts))
  stopWatchdog()

  // Case (3): cypress.run() never resolved because rctf's broken after:run
  // left its internal promise chain dangling. The signal handler caught
  // the unhandled rejection; treat the run as complete and read disk.
  if (outcome.__cosmetic) {
    console.warn('Bypassing hung cypress.run(); reading per-spec results from disk to determine retries.')
    renameReports()
    return readFailedSpecsFromReports(reportSnapshot)
  }

  // Case (2): cypress.run() rejected. Cosmetic crash → disk fallback;
  // anything else → real error.
  if (outcome.__error) {
    if (isCosmeticCrash(outcome.__error)) {
      console.warn('cypress.run() rejected with a known post-run rctf/cucumber error:')
      console.warn(`  ${(outcome.__error.message || String(outcome.__error)).split('\n')[0]}`)
      console.warn('Specs already completed; reading per-spec results from disk to determine retries.')
      renameReports()
      return readFailedSpecsFromReports(reportSnapshot)
    }
    throw outcome.__error
  }

  // Case (1): cypress.run() resolved. Either normal results, or
  // {status:'failed'} for a startup/run error.
  const results = outcome.__value
  if (results.status === 'failed') {
    if (isCosmeticCrash(results)) {
      console.warn('Cypress reported a post-run config crash (known rctf/cucumber issue):')
      console.warn(`  ${(results.message || '').split('\n')[0]}`)
      console.warn('Specs already completed; reading per-spec results from disk to determine retries.')
      renameReports()
      return readFailedSpecsFromReports(reportSnapshot)
    }
    console.error('Cypress runner failed to start:', results.message)
    return null
  }

  renameReports()

  return results.runs
    .filter(r => (r.stats && r.stats.failures > 0) || r.error)
    .map(r => r.spec.relative)
}

async function main() {
  let attempt = 1
  if (initialSpec) {
    console.log(`\n=== Attempt ${attempt}: running ${initialSpec.length} spec(s) matching --spec ===`)
  } else {
    console.log(`\n=== Attempt ${attempt}: running all specs ===`)
  }
  let failed = await runSpecs(initialSpec, attempt)

  while (failed && failed.length > 0 && attempt < MAX_ATTEMPTS) {
    attempt++
    console.log(`\n=== Attempt ${attempt}: rerunning ${failed.length} failed spec(s) ===`)
    failed.forEach(s => console.log('  -', s))
    failed = await runSpecs(failed, attempt)
  }

  if (failed === null) {
    console.error('Cypress runner errored — exiting non-zero')
    process.exit(1)
  }

  if (failed.length > 0) {
    console.error(`\n${failed.length} spec(s) still failing after ${attempt} attempt(s):`)
    failed.forEach(s => console.error('  -', s))
    process.exit(1)
  }

  console.log(`\nAll specs passed within ${attempt} attempt(s)`)
  process.exit(0)
}

main().catch(err => {
  console.error('Unexpected error:', err)
  process.exit(1)
})
