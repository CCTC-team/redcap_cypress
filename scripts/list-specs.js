#!/usr/bin/env node
const fs = require('fs')
const { globSync } = require('glob')

const PATTERNS = [
  'cypress/features/*.feature',
  'redcap_rsvc/*/[ABCD]/*/*.feature',
  '../redcap_source/modules/*/automated_tests/**/*.feature',
  '../redcap_source/modules/*/automated-tests/**/*.feature',
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

console.error(`[list-specs] total=${all.length} shard=${shardIndex}/${shardTotal} picked=${slice.length}`)

const outPath = process.argv[2]
if (outPath) {
  fs.writeFileSync(outPath, slice.join('\n') + '\n')
} else {
  process.stdout.write(slice.join('\n') + '\n')
}
