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

function parseArgs(argv) {
  const out = {}
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i]
    if (a === '--spec') out.spec = argv[++i]
    else if (a === '--browser') out.browser = argv[++i]
    else if (a === '--config') out.config = argv[++i]
    else if (a === '--env') out.env = argv[++i]
    else if (a === '--config-file') out.configFile = argv[++i]
  }
  return out
}

const cliArgs = parseArgs(process.argv.slice(2))
const initialSpec = cliArgs.spec ? cliArgs.spec.split(',') : null

async function runSpecs(specs, attempt) {
  const opts = {
    browser: cliArgs.browser || process.env.CYPRESS_BROWSER || 'chrome',
  }
  if (cliArgs.config) opts.config = cliArgs.config
  if (cliArgs.configFile) opts.configFile = cliArgs.configFile
  if (cliArgs.env) opts.env = cliArgs.env
  if (specs && specs.length) opts.spec = specs.join(',')

  if (process.env.CYPRESS_RECORD_KEY) {
    opts.record = true
    opts.key = process.env.CYPRESS_RECORD_KEY
    opts.group = `core-tests-attempt-${attempt}`
    if (process.env.GITHUB_RUN_ID) {
      const base = `${process.env.GITHUB_RUN_ID}-${process.env.GITHUB_RUN_ATTEMPT || 1}`
      opts.ciBuildId = `${base}-attempt-${attempt}`
    }
  }

  const results = await cypress.run(opts)

  if (results.status === 'failed') {
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
