#!/usr/bin/env node
const cypress = require('cypress')
const { spawn } = require('child_process')
const fs = require('fs')
const os = require('os')
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
    // If a trimmed report for this spec already exists (a stale file from a prior
    // retry attempt that pre-run cleanup didn't remove), the freshly written
    // `src` is the newer result and must win. Skipping would leave BOTH on disk,
    // so the feature appears twice in the merged HTML — the older partial attempt
    // (failing scenario shown as pending/stripped, reads as "passed") alongside
    // the real failure. Replace rather than skip.
    if (fs.existsSync(dst)) fs.rmSync(dst, { force: true })
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
  // Match by report CONTENT (the spec path baked into each JSON), not by
  // filename. mochawesome's `overwrite:false` counter plus renameReports() make
  // the on-disk name an unreliable key: a stem mismatch leaves the prior
  // attempt's report behind, it survives into the merge, and the feature shows
  // up twice in the HTML. `results[0].fullFile` is the exact spec path, immune
  // to renaming — so we delete every fragment whose spec is being retried.
  const wantBasenames = new Set(specs.map(s => path.basename(s)))
  const stemTargets = new Set()
  for (const s of specs) {
    for (const stem of reportStemsForSpec(s)) stemTargets.add(stem)
  }
  for (const f of fs.readdirSync(REPORT_DIR)) {
    if (!f.endsWith('.json')) continue
    const full = path.join(REPORT_DIR, f)
    let matched = false
    try {
      const report = JSON.parse(fs.readFileSync(full, 'utf8'))
      const fullFile = report.results && report.results[0] && report.results[0].fullFile
      if (fullFile && wantBasenames.has(path.basename(fullFile))) matched = true
    } catch {
      // Unparseable (e.g. concatenated objects from overwrite:false) — fall
      // through to the filename-stem match so we still clean it up.
    }
    if (!matched) {
      // Strip `.json` and any `_NNN` overwrite counter to get the bare stem.
      const stem = f.replace(/\.json$/, '').replace(/_\d+$/, '')
      if (stemTargets.has(stem)) matched = true
    }
    if (matched) fs.rmSync(full, { force: true })
  }
}

// Defense-in-depth after all attempts: guarantee at most one report per spec.
// If a retry's pre-run cleanup ever misses a stale fragment, mochawesome-merge
// concatenates both attempts and the feature appears twice in the HTML — the
// earlier partial attempt (failing scenario stripped to pending, reads as
// "passed") next to the real failure. Keep only the newest (final-attempt)
// report per spec so the merged report reflects the last attempt's true outcome.
function dedupeReportsByFullFile() {
  if (!fs.existsSync(REPORT_DIR)) return
  const byFullFile = new Map() // fullFile -> [{ file, mtime }]
  for (const f of fs.readdirSync(REPORT_DIR)) {
    if (!f.endsWith('.json')) continue
    const full = path.join(REPORT_DIR, f)
    let fullFile
    try {
      const report = JSON.parse(fs.readFileSync(full, 'utf8'))
      fullFile = report.results && report.results[0] && report.results[0].fullFile
    } catch {
      continue // leave unparseable files for the merge step to surface
    }
    if (!fullFile) continue
    if (!byFullFile.has(fullFile)) byFullFile.set(fullFile, [])
    byFullFile.get(fullFile).push({ file: full, mtime: fs.statSync(full).mtimeMs })
  }
  for (const [fullFile, entries] of byFullFile) {
    if (entries.length < 2) continue
    entries.sort((a, b) => b.mtime - a.mtime) // newest (final attempt) first
    const [keep, ...stale] = entries
    console.warn(`Deduping ${entries.length} report fragments for ${fullFile}: keeping newest ${path.basename(keep.file)}, removing ${stale.length} stale.`)
    for (const s of stale) fs.rmSync(s.file, { force: true })
  }
}

// Snapshot mtimes of report files before a run so we can identify which
// reports were produced by *this* attempt (vs prior attempts).
function snapshotReportMtimes(dir = REPORT_DIR) {
  if (!fs.existsSync(dir)) return {}
  const out = {}
  for (const f of fs.readdirSync(dir)) {
    if (!f.endsWith('.json')) continue
    out[f] = fs.statSync(path.join(dir, f)).mtimeMs
  }
  return out
}

// Read mochawesome JSONs written/updated since `snapshot` and return
// `{ fullFile, failures }` for each. Unchanged files are from a prior attempt
// and unparseable ones can't be attributed to a spec, so both are skipped.
function collectFreshReports(snapshot, dir = REPORT_DIR) {
  if (!fs.existsSync(dir)) return []
  const fresh = []
  for (const f of fs.readdirSync(dir)) {
    if (!f.endsWith('.json')) continue
    const fullPath = path.join(dir, f)
    const mtime = fs.statSync(fullPath).mtimeMs
    const prev = snapshot[f]
    if (prev !== undefined && mtime <= prev) continue // not from this attempt
    let report
    try {
      report = JSON.parse(fs.readFileSync(fullPath, 'utf8'))
    } catch {
      continue
    }
    const fullFile = report.results && report.results[0] && report.results[0].fullFile
    if (!fullFile) continue
    fresh.push({ fullFile, failures: (report.stats && report.stats.failures) || 0 })
  }
  return fresh
}

// Decide which of an attempt's specs need another run: those whose fresh
// report has failures, plus those with no fresh report at all (the spec was
// frozen when the attempt ended, or never got to run). Specs are matched to
// reports by basename because `fullFile` is absolute while the spec list may
// be relative; the spec paths are returned as given so they can be passed
// straight back to Cypress.
function specsToRetry(attemptSpecs, freshReports) {
  const failuresByBasename = new Map()
  for (const r of freshReports) {
    const base = path.basename(r.fullFile)
    failuresByBasename.set(base, (failuresByBasename.get(base) || 0) + r.failures)
  }
  return attemptSpecs.filter(s => {
    const failures = failuresByBasename.get(path.basename(s))
    return failures === undefined || failures > 0
  })
}

// Relative spec paths with failures in reports written since `snapshot`.
// Used as a fallback when cypress.run() returns status:'failed' due to a known
// post-run config crash but the specs themselves already wrote reports to disk.
function readFailedSpecsFromReports(snapshot) {
  return collectFreshReports(snapshot)
    .filter(r => r.failures > 0)
    .map(r => path.relative(process.cwd(), r.fullFile))
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
function onUnhandledRejection(reason) {
  if (isCosmeticCrash(reason)) {
    cosmeticCrashSignal = reason
    console.warn('Cosmetic post-run rctf/cucumber rejection detected (specs already wrote reports):')
    console.warn(`  ${(reason && (reason.message || String(reason))).split('\n')[0]}`)
    return
  }
  console.error('Unhandled rejection:', reason)
  process.exit(1)
}

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

// Cypress announces each spec as it starts, e.g.
//   "  Running:  A.2.2.0100. - Create Users.feature          (1 of 3)"
// Returns the spec name from such a line, or null for any other line.
function parseRunningSpec(line) {
  const m = line.replace(/\x1b\[[0-9;]*m/g, '').match(/Running:\s+(.+?)\s+\(\d+ of \d+\)\s*$/)
  return m ? m[1] : null
}

// After an attempt is killed, split its specs that wrote no report into the
// one that froze and the ones that never got to start. The frozen spec is the
// one Cypress last announced; if that can't be matched, the first spec in the
// list without a report is the best guess.
function classifyStall(attemptSpecs, freshReports, runningSpec) {
  const reported = new Set(freshReports.map(r => path.basename(r.fullFile)))
  const missing = attemptSpecs.filter(s => !reported.has(path.basename(s)))
  let frozen = runningSpec
    ? missing.find(s => path.basename(s) === path.basename(runningSpec))
    : undefined
  if (!frozen) frozen = missing[0]
  return { frozen: frozen || null, neverRan: missing.filter(s => s !== frozen) }
}

// Specs from the attempt that Cypress didn't report on at all. Matched by
// basename because Cypress reports paths relative to the project root.
function specsMissingFromRun(attemptSpecs, ranSpecs) {
  const ran = new Set(ranSpecs.map(s => path.basename(s)))
  return attemptSpecs.filter(s => !ran.has(path.basename(s)))
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
    else if (a === '--attempt-worker') out.attemptWorker = true
    else if (a === '--attempt') out.attempt = parseInt(argv[++i], 10)
    else if (a === '--result-file') out.resultFile = argv[++i]
  }
  return out
}

const cliArgs = parseArgs(process.argv.slice(2))

function readInitialSpec() {
  if (cliArgs.specFile) {
    return fs.readFileSync(cliArgs.specFile, 'utf8')
      .split('\n')
      .map(s => s.trim())
      .filter(Boolean)
  }
  if (cliArgs.spec) return cliArgs.spec.split(',')
  return null
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

  const outcome = await runWithCosmeticDetection(cypress.run(opts))

  // Returns { failed, ran }: the specs to retry, and every spec Cypress
  // reported on (null when results had to be read from disk instead), or
  // null when the runner failed to start.
  const fromDisk = () => ({ failed: readFailedSpecsFromReports(reportSnapshot), ran: null })

  // Case (3): cypress.run() never resolved because the post-run
  // afterSpecHandler crash left its internal promise chain dangling. The signal handler caught
  // the unhandled rejection; treat the run as complete and read disk.
  if (outcome.__cosmetic) {
    console.warn('Bypassing hung cypress.run(); reading per-spec results from disk to determine retries.')
    renameReports()
    return fromDisk()
  }

  // Case (2): cypress.run() rejected. Cosmetic crash → disk fallback;
  // anything else → real error.
  if (outcome.__error) {
    if (isCosmeticCrash(outcome.__error)) {
      console.warn('cypress.run() rejected with a known post-run rctf/cucumber error:')
      console.warn(`  ${(outcome.__error.message || String(outcome.__error)).split('\n')[0]}`)
      console.warn('Specs already completed; reading per-spec results from disk to determine retries.')
      renameReports()
      return fromDisk()
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
      return fromDisk()
    }
    console.error('Cypress runner failed to start:', results.message)
    return null
  }

  renameReports()

  return {
    failed: results.runs
      .filter(r => (r.stats && r.stats.failures > 0) || r.error)
      .map(r => r.spec.relative),
    ran: results.runs.map(r => r.spec.relative),
  }
}

// Worker mode: run one attempt's cypress.run() and hand the outcome back to
// the parent through --result-file. The parent owns the retry loop and the
// watchdog, so a frozen run can be killed without ending the whole job.
async function workerMain() {
  process.on('unhandledRejection', onUnhandledRejection)
  const outcome = await runSpecs(readInitialSpec(), cliArgs.attempt)
  const result = outcome ? { status: 'ok', ...outcome } : { status: 'startup-error' }
  fs.writeFileSync(cliArgs.resultFile, JSON.stringify(result))
  process.exit(0)
}

const STALL_MS = parseInt(process.env.CYPRESS_STALL_MS || '900000', 10) // 15 min
const STALL_LABEL = STALL_MS >= 60000 ? `${Math.round(STALL_MS / 60000)} min` : `${Math.round(STALL_MS / 1000)} s`

// The worker currently running an attempt, so a SIGTERM/SIGINT to this
// process can take its whole process group down too.
let activeWorker = null

// The worker is started detached, so it leads its own process group holding
// Cypress, the browser and Xvfb. Killing the group (negative pid) stops all
// of them at once. ESRCH just means the group is already gone. After the worker
// has exited, macOS reports EPERM for a group left holding only zombies, so the
// post-exit sweep passes `afterExit` to treat that as gone too.
function killWorkerGroup(child, afterExit = false) {
  if (!child || !child.pid) return
  try {
    process.kill(-child.pid, 'SIGKILL')
  } catch (err) {
    if (err.code === 'ESRCH' || (afterExit && err.code === 'EPERM')) return
    console.warn(`Could not kill attempt worker group ${child.pid}: ${err.message}`)
  }
}

// Run one attempt in a worker process, watching for a stall. Progress is any
// output from the worker or a newly written report, so a long spec that is
// still printing steps is never mistaken for a frozen one. Resolves to
// { failed, stall }: `failed` is null if the runner itself errored, and
// `stall` is { frozen, neverRan } when the attempt was killed.
function runAttempt(specs, attempt) {
  const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'rerun-failed-'))
  const resultFile = path.join(tmpDir, 'result.json')
  const args = [__filename, '--attempt-worker', '--attempt', String(attempt), '--result-file', resultFile]
  if (specs) {
    const specFile = path.join(tmpDir, 'specs.txt')
    fs.writeFileSync(specFile, specs.join('\n') + '\n')
    args.push('--spec-file', specFile)
  }
  if (cliArgs.browser) args.push('--browser', cliArgs.browser)
  if (cliArgs.config) args.push('--config', cliArgs.config)
  if (cliArgs.env) args.push('--env', cliArgs.env)
  if (cliArgs.configFile) args.push('--config-file', cliArgs.configFile)

  // Output is piped (so it can be watched), which would make Cypress drop its
  // colours in an interactive terminal.
  const env = { ...process.env }
  if (process.stdout.isTTY && env.FORCE_COLOR === undefined) env.FORCE_COLOR = '1'

  const snapshot = snapshotReportMtimes()

  return new Promise(resolve => {
    const child = spawn(process.execPath, args, { detached: true, stdio: ['ignore', 'pipe', 'pipe'], env })
    activeWorker = child

    let lastProgressTs = Date.now()
    let lastSeenMtime = latestReportMtime()
    let runningSpec = null
    let partialLine = ''
    let stalled = false

    child.stdout.on('data', chunk => {
      process.stdout.write(chunk)
      lastProgressTs = Date.now()
      const lines = (partialLine + chunk.toString()).split('\n')
      partialLine = lines.pop()
      for (const line of lines) {
        const spec = parseRunningSpec(line)
        if (spec) runningSpec = spec
      }
    })
    child.stderr.on('data', chunk => {
      process.stderr.write(chunk)
      lastProgressTs = Date.now()
    })

    const watchdog = setInterval(() => {
      const now = Date.now()
      const m = latestReportMtime()
      if (m > lastSeenMtime) {
        lastSeenMtime = m
        lastProgressTs = now
      }
      if (!stalled && now - lastProgressTs > STALL_MS) {
        stalled = true
        console.error(`\n=== WATCHDOG: attempt ${attempt} stalled (no Cypress output for ${STALL_LABEL}) — killing it and retrying ===`)
        killWorkerGroup(child)
      }
    }, Math.min(60000, Math.max(1000, Math.floor(STALL_MS / 4))))

    const finish = outcome => {
      clearInterval(watchdog)
      activeWorker = null
      fs.rmSync(tmpDir, { recursive: true, force: true })
      resolve(outcome)
    }

    child.on('error', err => {
      console.error('Could not start the attempt worker:', err.message)
      finish({ failed: null, stall: null })
    })

    child.on('exit', (code, signal) => {
      // Sweep up anything the worker left behind (a browser that outlived
      // cypress.run(), say) before the next attempt starts.
      killWorkerGroup(child, true)

      if (stalled) {
        if (!specs) {
          console.error('No explicit spec list, so the specs that did not run cannot be retried. Exiting.')
          fs.rmSync(tmpDir, { recursive: true, force: true })
          process.exit(2)
        }
        const fresh = collectFreshReports(snapshot)
        renameReports()
        const stall = classifyStall(specs, fresh, runningSpec)
        if (stall.frozen) console.error(`  stalled: ${stall.frozen}`)
        if (stall.neverRan.length) console.error(`  never ran: ${stall.neverRan.length} spec(s) after it`)
        finish({ failed: specsToRetry(specs, fresh), stall })
        return
      }

      let result = null
      try {
        result = JSON.parse(fs.readFileSync(resultFile, 'utf8'))
      } catch {
        console.error(`Attempt worker exited (${signal || `code ${code}`}) without a result.`)
        finish({ failed: null, stall: null })
        return
      }
      if (result.status !== 'ok') {
        finish({ failed: null, stall: null })
        return
      }

      // Cypress's own results decide pass/fail. A spec in the list that it
      // never reported on at all still needs another run.
      const failed = [...result.failed]
      if (specs && result.ran) {
        const already = new Set(failed.map(s => path.basename(s)))
        for (const s of specsMissingFromRun(specs, result.ran)) {
          if (!already.has(path.basename(s))) failed.push(s)
        }
      }
      finish({ failed, stall: null })
    })
  })
}

async function main() {
  // The worker runs in its own process group, so a Ctrl-C or a cancelled CI
  // job never reaches it directly; take it down before exiting.
  for (const signal of ['SIGTERM', 'SIGINT']) {
    process.on(signal, () => {
      killWorkerGroup(activeWorker)
      process.exit(signal === 'SIGINT' ? 130 : 143)
    })
  }

  const initialSpec = readInitialSpec()
  let attempt = 1
  if (initialSpec) {
    console.log(`\n=== Attempt ${attempt}: running ${initialSpec.length} spec(s) matching --spec ===`)
  } else {
    console.log(`\n=== Attempt ${attempt}: running all specs ===`)
  }
  let { failed, stall } = await runAttempt(initialSpec, attempt)

  while (failed && failed.length > 0 && attempt < MAX_ATTEMPTS) {
    attempt++
    console.log(`\n=== Attempt ${attempt}: rerunning ${failed.length} failed spec(s) ===`)
    failed.forEach(s => console.log('  -', s))
    ;({ failed, stall } = await runAttempt(failed, attempt))
  }

  // Collapse any duplicate per-spec reports so the merged HTML shows exactly one
  // result per feature file — the final attempt. Without this a spec that failed
  // every attempt can appear multiple times, its partial passing runs reading as
  // green alongside the real failure.
  dedupeReportsByFullFile()

  if (failed === null) {
    console.error('Cypress runner errored — exiting non-zero')
    process.exit(1)
  }

  if (failed.length > 0) {
    console.error(`\n${failed.length} spec(s) still failing after ${attempt} attempt(s):`)
    failed.forEach(s => console.error('  -', s))
    if (stall) {
      // The last attempt was killed: separate the spec that froze from the
      // specs it blocked, which may well be fine and just need a re-run.
      if (stall.frozen) console.error(`of which stalled (no Cypress output for ${STALL_LABEL}):\n  - ${stall.frozen}`)
      if (stall.neverRan.length) {
        console.error('of which never ran (blocked by the stalled spec):')
        stall.neverRan.forEach(s => console.error('  -', s))
      }
    }
    process.exit(1)
  }

  console.log(`\nAll specs passed within ${attempt} attempt(s)`)
  process.exit(0)
}

if (require.main === module) {
  const entry = cliArgs.attemptWorker ? workerMain : main
  entry().catch(err => {
    console.error('Unexpected error:', err)
    process.exit(1)
  })
}

module.exports = {
  specsToRetry,
  collectFreshReports,
  snapshotReportMtimes,
  trimSpecPrefix,
  parseRunningSpec,
  classifyStall,
  specsMissingFromRun,
}
