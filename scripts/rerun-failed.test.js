const test = require('node:test')
const assert = require('node:assert/strict')
const fs = require('fs')
const os = require('os')
const path = require('path')

const {
  specsToRetry,
  collectFreshReports,
  snapshotReportMtimes,
  parseRunningSpec,
  classifyStall,
  specsMissingFromRun,
} = require('./rerun-failed')

const SPEC_A = '../redcap_source/modules/foo/A.1.feature'
const SPEC_B = '../redcap_source/modules/foo/B.2.feature'
const SPEC_C = '../redcap_source/modules/foo/C.3.feature'

test('specsToRetry: every spec has a passing fresh report', () => {
  const fresh = [
    { fullFile: '/work/redcap_source/modules/foo/A.1.feature', failures: 0 },
    { fullFile: '/work/redcap_source/modules/foo/B.2.feature', failures: 0 },
  ]
  assert.deepEqual(specsToRetry([SPEC_A, SPEC_B], fresh), [])
})

test('specsToRetry: a fresh report with failures is retried', () => {
  const fresh = [
    { fullFile: '/work/redcap_source/modules/foo/A.1.feature', failures: 0 },
    { fullFile: '/work/redcap_source/modules/foo/B.2.feature', failures: 2 },
  ]
  assert.deepEqual(specsToRetry([SPEC_A, SPEC_B], fresh), [SPEC_B])
})

test('specsToRetry: specs with no fresh report (stalled or never reached) are retried', () => {
  const fresh = [{ fullFile: '/work/redcap_source/modules/foo/A.1.feature', failures: 0 }]
  assert.deepEqual(specsToRetry([SPEC_A, SPEC_B, SPEC_C], fresh), [SPEC_B, SPEC_C])
})

test('specsToRetry: an empty fresh report list retries every spec', () => {
  assert.deepEqual(specsToRetry([SPEC_A, SPEC_B], []), [SPEC_A, SPEC_B])
})

test('specsToRetry: matches by basename and keeps spec paths exactly as given', () => {
  const specs = ['cypress/features/A.1.feature', '/abs/path/B.2.feature']
  const fresh = [
    { fullFile: '/work/cypress/features/A.1.feature', failures: 1 },
    { fullFile: '/other/root/B.2.feature', failures: 0 },
  ]
  assert.deepEqual(specsToRetry(specs, fresh), ['cypress/features/A.1.feature'])
})

function writeReport(dir, name, fullFile, failures) {
  const report = { stats: { failures }, results: [{ fullFile }] }
  fs.writeFileSync(path.join(dir, name), JSON.stringify(report))
}

function withTempDir(fn) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'rerun-failed-test-'))
  try {
    return fn(dir)
  } finally {
    fs.rmSync(dir, { recursive: true, force: true })
  }
}

// Push a file's mtime into the past so a rewrite is guaranteed to look newer.
function age(dir, name) {
  const past = new Date(Date.now() - 60000)
  fs.utimesSync(path.join(dir, name), past, past)
}

test('collectFreshReports: includes new and rewritten reports, skips unchanged ones', () => {
  withTempDir(dir => {
    writeReport(dir, 'A.1.json', '/work/A.1.feature', 0)
    writeReport(dir, 'B.2.json', '/work/B.2.feature', 0)
    age(dir, 'A.1.json')
    age(dir, 'B.2.json')
    const snapshot = snapshotReportMtimes(dir)

    writeReport(dir, 'B.2.json', '/work/B.2.feature', 3) // rewritten this attempt
    writeReport(dir, 'C.3.json', '/work/C.3.feature', 0) // new this attempt

    const fresh = collectFreshReports(snapshot, dir)
      .sort((a, b) => a.fullFile.localeCompare(b.fullFile))
    assert.deepEqual(fresh, [
      { fullFile: '/work/B.2.feature', failures: 3 },
      { fullFile: '/work/C.3.feature', failures: 0 },
    ])
  })
})

test('collectFreshReports: skips unparseable JSON and non-json files', () => {
  withTempDir(dir => {
    const snapshot = snapshotReportMtimes(dir)
    fs.writeFileSync(path.join(dir, 'broken.json'), '{"stats":{}}{"stats":{}}')
    fs.writeFileSync(path.join(dir, 'notes.txt'), 'hello')
    writeReport(dir, 'A.1.json', '/work/A.1.feature', 0)
    assert.deepEqual(collectFreshReports(snapshot, dir), [
      { fullFile: '/work/A.1.feature', failures: 0 },
    ])
  })
})

test('collectFreshReports: a stale report does not make its spec count as passing', () => {
  withTempDir(dir => {
    writeReport(dir, 'A.1.json', '/work/A.1.feature', 0)
    age(dir, 'A.1.json')
    const snapshot = snapshotReportMtimes(dir)
    const fresh = collectFreshReports(snapshot, dir)
    assert.deepEqual(fresh, [])
    assert.deepEqual(specsToRetry(['A.1.feature'], fresh), ['A.1.feature'])
  })
})

test('collectFreshReports: missing report directory yields no reports', () => {
  assert.deepEqual(collectFreshReports({}, path.join(os.tmpdir(), 'rerun-failed-does-not-exist')), [])
})

test('parseRunningSpec: reads the spec name from a Cypress "Running:" line', () => {
  assert.equal(
    parseRunningSpec('  Running:  A.2.2.0100. - Create Users.feature                     (1 of 3)'),
    'A.2.2.0100. - Create Users.feature',
  )
  assert.equal(
    parseRunningSpec('\x1b[90m  Running:  \x1b[39m\x1b[90mB.2.feature\x1b[39m          \x1b[90m(12 of 40)\x1b[39m'),
    'B.2.feature',
  )
  assert.equal(parseRunningSpec('    ✓ Given I login to REDCap with the user "Test_Admin" (1234ms)'), null)
})

test('classifyStall: the announced spec is frozen, the other unreported specs never ran', () => {
  const fresh = [{ fullFile: '/work/redcap_source/modules/foo/A.1.feature', failures: 0 }]
  assert.deepEqual(classifyStall([SPEC_A, SPEC_B, SPEC_C], fresh, 'modules/foo/C.3.feature'), {
    frozen: SPEC_C,
    neverRan: [SPEC_B],
  })
})

test('classifyStall: falls back to the first unreported spec when the running spec is unknown', () => {
  const fresh = [{ fullFile: '/work/redcap_source/modules/foo/A.1.feature', failures: 0 }]
  assert.deepEqual(classifyStall([SPEC_A, SPEC_B, SPEC_C], fresh, null), {
    frozen: SPEC_B,
    neverRan: [SPEC_C],
  })
  assert.deepEqual(classifyStall([SPEC_A, SPEC_B, SPEC_C], fresh, 'Z.9.feature'), {
    frozen: SPEC_B,
    neverRan: [SPEC_C],
  })
})

test('classifyStall: a spec that already wrote a report is never called frozen', () => {
  const fresh = [{ fullFile: '/work/redcap_source/modules/foo/A.1.feature', failures: 1 }]
  assert.deepEqual(classifyStall([SPEC_A, SPEC_B], fresh, 'A.1.feature'), {
    frozen: SPEC_B,
    neverRan: [],
  })
})

test('specsMissingFromRun: returns specs Cypress did not report on, matched by basename', () => {
  const ran = ['redcap_source/modules/foo/A.1.feature', 'redcap_source/modules/foo/C.3.feature']
  assert.deepEqual(specsMissingFromRun([SPEC_A, SPEC_B, SPEC_C], ran), [SPEC_B])
  assert.deepEqual(specsMissingFromRun([SPEC_A], ran), [])
})
