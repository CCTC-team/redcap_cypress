#!/usr/bin/env node
// Core-only variant of scripts/list-specs.js used by run-ci.sh to emulate the
// redcap_cypress CI workflow locally.
//
// Why a variant: scripts/list-specs.js also globs ../redcap_source/modules/*/
// automated_tests, which in CI's fresh redcap_cypress clone matches NOTHING (no
// EMs are present). In a local dev tree those module dirs DO exist, so the real
// script picks up ~183 extra EM specs and the shard slicing no longer matches
// CI. This file keeps ONLY the core patterns so SHARD_INDEX/SHARD_TOTAL slice the
// exact same 248-spec set CI's core run shards. Algorithm (sort + i%total) is
// identical to list-specs.js. Set INCLUDE_MODULES=1 in run-ci.sh to use the real
// script instead.
const fs = require('fs')
const { globSync } = require('glob')

const PATTERNS = [
  'cypress/features/*.feature',
  'redcap_rsvc/*/[ABCD]/*/*.feature',
]
const IGNORE = [
  'redcap_rsvc/*/[ABCD]/*/*REDUNDANT*.feature',
]

const cwd = process.cwd()
const found = new Set()
for (const pattern of PATTERNS) {
  for (const f of globSync(pattern, { cwd, posix: true, ignore: IGNORE })) {
    found.add(f)
  }
}
const all = [...found].sort()

const shardIndex = parseInt(process.env.SHARD_INDEX || '0', 10)
const shardTotal = parseInt(process.env.SHARD_TOTAL || '0', 10)
const slice = (shardIndex && shardTotal)
  ? all.filter((_, i) => i % shardTotal === shardIndex - 1)
  : all

console.error(`[list-core-specs] total=${all.length} shard=${shardIndex}/${shardTotal} picked=${slice.length}`)

const outPath = process.argv[2]
if (outPath) {
  fs.writeFileSync(outPath, slice.join('\n') + '\n')
} else {
  process.stdout.write(slice.join('\n') + '\n')
}
