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

// rctf's plugins/index.js registers an after:run handler that drops the
// `results` arg (calls `afterRunHandler(config)` instead of
// `afterRunHandler(config, results)`). Inside the cucumber preprocessor
// that becomes `'totalFailed' in undefined`, which throws *after* all
// specs have completed and written their reports. Depending on how
// Cypress catches it, this surfaces as one of:
//   1. cypress.run() resolves with {status:'failed', message}
//   2. cypress.run() rejects with an Error
//   3. an unhandled promise rejection emitted by the event loop *after*
//      cypress.run() has already resolved with normal results
// All three are cosmetic — the test results are already on disk.
const POST_RUN_COSMETIC_CRASH = /'totalFailed' in undefined|Unexpected state in afterSpecHandler/

function isCosmeticCrash(err) {
  const text = err && (err.message || err.stack || String(err))
  return !!text && POST_RUN_COSMETIC_CRASH.test(text)
}

// Swallow case (3): the rejection arrives after cypress.run() resolves,
// so try/catch can't see it. Log and keep going; the script's normal
// pass/fail logic still runs based on disk reports.
process.on('unhandledRejection', (reason) => {
  if (isCosmeticCrash(reason)) {
    console.warn('Ignoring known post-run rctf/cucumber rejection (specs already wrote reports):')
    console.warn(`  ${(reason && (reason.message || String(reason))).split('\n')[0]}`)
    return
  }
  console.error('Unhandled rejection:', reason)
  process.exit(1)
})

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

  const reportSnapshot = snapshotReportMtimes()

  startWatchdog()
  // Case (1) returns {status:'failed'}; case (2) throws. Handle both.
  let results
  try {
    results = await cypress.run(opts)
  } catch (err) {
    stopWatchdog()
    if (isCosmeticCrash(err)) {
      console.warn('cypress.run() rejected with a known post-run rctf/cucumber error:')
      console.warn(`  ${(err.message || String(err)).split('\n')[0]}`)
      console.warn('Specs already completed; reading per-spec results from disk to determine retries.')
      renameReports()
      return readFailedSpecsFromReports(reportSnapshot)
    }
    throw err
  }
  stopWatchdog()

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
