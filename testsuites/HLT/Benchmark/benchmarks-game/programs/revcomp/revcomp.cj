/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (LLVM) EXEC: %compiler %cmp_opt -O2 --fast-math %overflow_wrapping %f -o %output
// (JET) EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// Benchmarks Game reverse-complement. stdin is read buffered-read by buffered-read into a list of 16 MiB chunks
// (as the Java program does, so input bytes are never copied) and scanned for records while reading goes on.
// Each record is reverse-complemented in place (every '\n' stays where it is), large records by several tasks,
// and the records are written to stdout in input order.

import std.collection.*
import std.env.*
import std.process.*
import std.runtime.*

let threadNum: Int64 = getProcessorCount()
let GT: UInt8 = 62 // '>'
let NL: UInt8 = 10 // '\n'
let CHUNK_BITS: Int64 = 24
let CHUNK: Int64 = 1 << CHUNK_BITS // input chunk size, the same as CHUNK_SIZE in the Java program
let BLOCK: Int64 = 1 << 16 // newline counts are kept per 64 KiB block; a chunk holds a whole number of blocks
let SCAN_STEP: Int64 = 1 << 22 // bytes per scan task; must be a multiple of BLOCK
let SPLIT_MIN: Int64 = 1 << 20 // records smaller than this are handled by a single task
let complement: Array<UInt8> = buildComplement()

// Upper- and lower-case nucleotide codes map to the upper-case complement; every other byte maps to itself.
func buildComplement(): Array<UInt8> {
    let table = Array<UInt8>(256, {i => UInt8(i)})
    let pairs = "ATCGGCTAUAMKRYWWSSYRKMVBHDDHBVNN".toArray()
    var i = 0
    while (i < pairs.size) {
        let code = Int64(pairs[i])
        table[code] = pairs[i + 1]
        table[code + 32] = pairs[i + 1] // lower case
        i += 2
    }
    return table
}

// Newline count per block and line-start '>' positions (global) of chunk[lo..hi).
// `base` is the global position of chunk[0]; `before` is the byte preceding chunk[lo] (NL at the input start).
func scanPiece(chunk: Array<UInt8>, base: Int64, lo: Int64, hi: Int64, before: UInt8):
    (Array<Int64>, ArrayList<Int64>) {
    let counts = Array<Int64>((hi - lo + BLOCK - 1) / BLOCK, repeat: 0)
    let found = ArrayList<Int64>()
    var b = 0
    var blockStart = lo
    while (blockStart < hi) {
        let blockEnd = min(blockStart + BLOCK, hi)
        var c = 0
        for (i in blockStart..blockEnd) {
            let x = chunk[i]
            if (x > GT) { // nucleotide letters, the common case
                continue
            }
            if (x == NL) {
                c++
            } else if (x == GT && (if (i == lo) { before } else { chunk[i - 1] }) == NL) {
                found.add(base + i)
            }
        }
        counts[b] = c
        b++
        blockStart = blockEnd
    }
    return (counts, found)
}

// The input as a list of chunks, plus record starts and newline counts.
class Input {
    let chunks = ArrayList<Array<UInt8>>() // every chunk but the last is full
    let size: Int64
    let nlBefore: Array<Int64> // nlBefore[b]: number of '\n' in [0, b * BLOCK)
    let headers = ArrayList<Int64>() // positions of '>' at the start of a line, ascending

    init() {
        // Process.current.stdIn is deprecated, but std.env.getStdIn() reads line by line through a native
        // getchar() loop and makes this program about 25x slower.
        let input = Process.current.stdIn
        let scans = ArrayList<(Int64, Future<(Array<Int64>, ArrayList<Int64>)>)>() // (first block, task)
        var total = 0
        var before = NL
        while (true) {
            let chunk = Array<UInt8>(CHUNK, repeat: 0)
            var len = 0
            var scanned = 0
            var eof = false
            while (len < CHUNK) {
                let n = input.read(chunk[len..CHUNK])
                if (n <= 0) {
                    eof = true
                    break
                }
                len += n
                // scan tasks only read bytes below len, which the reads never touch again
                while (len - scanned >= SCAN_STEP) {
                    let (lo, prev, base) = (scanned, if (scanned == 0) { before } else { chunk[scanned - 1] }, total)
                    scans.add(((base + lo) / BLOCK, spawn { scanPiece(chunk, base, lo, lo + SCAN_STEP, prev) }))
                    scanned += SCAN_STEP
                }
            }
            if (scanned < len) {
                let prev = if (scanned == 0) { before } else { chunk[scanned - 1] }
                let (lo, hi, base) = (scanned, len, total)
                scans.add(((base + lo) / BLOCK, spawn { scanPiece(chunk, base, lo, hi, prev) }))
            }
            if (len > 0) {
                chunks.add(chunk)
                before = chunk[len - 1]
                total += len
            }
            if (eof) {
                break
            }
        }
        size = total
        let nBlocks = (size + BLOCK - 1) / BLOCK
        nlBefore = Array<Int64>(nBlocks + 1, repeat: 0)
        for ((b0, f) in scans) {
            let (counts, found) = f.get()
            for (i in 0..counts.size) {
                nlBefore[b0 + i + 1] = nlBefore[b0 + i] + counts[i]
            }
            for (h in found) {
                headers.add(h)
            }
        }
    }

    func get(g: Int64): UInt8 {
        return chunks[g >> CHUNK_BITS][g & (CHUNK - 1)]
    }

    func set(g: Int64, v: UInt8): Unit {
        let chunk = chunks[g >> CHUNK_BITS]
        chunk[g & (CHUNK - 1)] = v
    }

    // Number of '\n' in [0, q).
    func newlinesBefore(q: Int64): Int64 {
        let b = q / BLOCK
        var c = nlBefore[b]
        for (i in b * BLOCK..q) {
            if (get(i) == NL) {
                c++
            }
        }
        return c
    }

    // Position of nucleotide k (0-based, newlines not counted) in the sequence data [from, to);
    // nlFrom is newlinesBefore(from).
    func positionOf(from: Int64, to: Int64, nlFrom: Int64, k: Int64): Int64 {
        // start from the last block boundary with at most k nucleotides before it
        var q = from
        var b = from / BLOCK + 1
        while (b * BLOCK < to && (b * BLOCK - from) - (nlBefore[b] - nlFrom) <= k) {
            q = b * BLOCK
            b++
        }
        var seen = (q - from) - (newlinesBefore(q) - nlFrom)
        while (true) {
            if (get(q) != NL) {
                if (seen == k) {
                    return q
                }
                seen++
            }
            q++
        }
        throw IllegalStateException("unreachable")
    }

    // Write [start, end) to out, one slice per chunk.
    func writeRange(out: ConsoleWriter, start: Int64, end: Int64): Unit {
        var g = start
        while (g < end) {
            let o = g & (CHUNK - 1)
            let n = min(end - g, CHUNK - o)
            out.write(chunks[g >> CHUNK_BITS][o..o + n])
            g += n
        }
    }
}

// Reverse-complement the whole sequence data [from, to) with two pointers, skipping newlines.
// Chunk-local like reverseRange: the inner loop only touches the two current chunks.
func reverseAll(ix: Input, from: Int64, to: Int64): Unit {
    var i = from
    var j = to - 1
    while (i < j) {
        let aBase = i & !(CHUNK - 1)
        let bBase = j & !(CHUNK - 1)
        let a = ix.chunks[i >> CHUNK_BITS]
        let b = ix.chunks[j >> CHUNK_BITS]
        var oi = i - aBase
        var oj = j - bBase
        while (aBase + oi < bBase + oj) {
            let x = a[oi]
            if (x == NL) {
                oi++
                if (oi == CHUNK) {
                    break
                }
                continue
            }
            let y = b[oj]
            if (y == NL) {
                oj--
                if (oj < 0) {
                    break
                }
                continue
            }
            a[oi] = complement[Int64(y)]
            b[oj] = complement[Int64(x)]
            oi++
            oj--
            if (oi == CHUNK || oj < 0) {
                break
            }
        }
        i = aBase + oi
        j = bBase + oj
    }
    if (i == j && ix.get(i) != NL) { // middle nucleotide of an odd-length sequence
        ix.set(i, complement[Int64(ix.get(i))])
    }
}

// Swap-and-complement `pairs` nucleotide pairs walking inwards from front and back, skipping newlines.
// Works one chunk pair at a time: the inner loop only touches the two current chunks, and the outer loop
// moves a pointer to the next/previous chunk when it runs off its chunk.
func reverseRange(ix: Input, front: Int64, back: Int64, pairs: Int64): Unit {
    var i = front
    var j = back
    var left = pairs
    while (left > 0) {
        let aBase = i & !(CHUNK - 1)
        let bBase = j & !(CHUNK - 1)
        let a = ix.chunks[i >> CHUNK_BITS]
        let b = ix.chunks[j >> CHUNK_BITS]
        var oi = i - aBase
        var oj = j - bBase
        while (left > 0) {
            while (oi < CHUNK && a[oi] == NL) {
                oi++
            }
            if (oi == CHUNK) {
                break // front needs the next chunk
            }
            while (oj >= 0 && b[oj] == NL) {
                oj--
            }
            if (oj < 0) {
                break // back needs the previous chunk
            }
            let x = a[oi]
            a[oi] = complement[Int64(b[oj])]
            b[oj] = complement[Int64(x)]
            oi++
            oj--
            left--
        }
        i = aBase + oi
        j = bBase + oj
    }
}

main(): Int64 {
    let ix = Input()
    let out = getStdOut()
    let first = if (ix.headers.size > 0) { ix.headers[0] } else { ix.size }
    ix.writeRange(out, 0, first) // bytes before the first header pass through unchanged

    // Phase 1: locate every record and every task's start positions. All reads that locate positions happen
    // here, before any task starts rewriting bytes.
    let records = ArrayList<(Int64, Int64, ArrayList<(Int64, Int64, Int64)>)>() // (start, end, pieces)
    for (r in 0..ix.headers.size) {
        let start = ix.headers[r]
        let end = if (r + 1 < ix.headers.size) { ix.headers[r + 1] } else { ix.size }
        var headerEnd = start
        while (headerEnd < end && ix.get(headerEnd) != NL) {
            headerEnd++
        }
        let from = min(headerEnd + 1, end) // sequence data starts after the header line
        let pieces = ArrayList<(Int64, Int64, Int64)>() // (front, back, pairs); pairs < 0: whole record [front, back)
        if (end - from < SPLIT_MIN) {
            pieces.add((from, end, -1))
        } else {
            let nlFrom = ix.newlinesBefore(from)
            let n = (end - from) - (ix.newlinesBefore(end) - nlFrom)
            let pairs = n / 2
            if (n % 2 == 1) {
                let m = ix.positionOf(from, end, nlFrom, pairs)
                ix.set(m, complement[Int64(ix.get(m))])
            }
            // about two tasks per core over the whole input, split by record size
            let parts = max(1, 2 * threadNum * (end - start) / ix.size)
            for (p in 0..parts) {
                let k0 = pairs * p / parts
                let k1 = pairs * (p + 1) / parts
                if (k0 < k1) {
                    let front = ix.positionOf(from, end, nlFrom, k0)
                    let back = ix.positionOf(from, end, nlFrom, n - 1 - k0)
                    pieces.add((front, back, k1 - k0))
                }
            }
        }
        records.add((start, end, pieces))
    }

    // Phase 2: rewrite in parallel (tasks touch disjoint bytes), then write the records in order as they finish.
    let running = ArrayList<(Int64, Int64, ArrayList<Future<Unit>>)>()
    for ((start, end, pieces) in records) {
        let tasks = ArrayList<Future<Unit>>()
        for ((front, back, pairs) in pieces) {
            if (pairs < 0) {
                tasks.add(spawn { reverseAll(ix, front, back) })
            } else {
                tasks.add(spawn { reverseRange(ix, front, back, pairs) })
            }
        }
        running.add((start, end, tasks))
    }
    for ((start, end, tasks) in running) {
        for (t in tasks) {
            t.get()
        }
        ix.writeRange(out, start, end)
    }
    out.flush()
    return 0
}
