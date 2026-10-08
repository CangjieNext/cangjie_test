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
// (LLVM) RUN-EXEC-PIPE: %export cjHeapSize=16GB && %run time %run_opt %output 50000 %run_args 1> log.txt
// (JET) RUN-EXEC-PIPE: %export JETVMPROP=-Xmx2G && time cj %run_opt %output 50000 %run_args 1> log.txt
// Rows are computed in parallel batch by batch and streamed to stdout, so only two small batch buffers are
// alive at any time instead of the whole N*N/8-byte bitmap (the Java program streams through an 8 KiB buffer).

import std.env.*
import std.sync.*
import std.convert.*
import std.collection.ArrayList
import std.runtime.*

const LIMIT: Float64 = 4.0
const ITER: Int64 = 50
// Bitmap bytes per batch; two batch buffers exist. Much smaller batches mean many more per-batch task objects,
// which is enough garbage to trigger GC and raises peak RSS again (1 << 16 measured > 100 MB at N = 50000).
const BATCH_BYTES: Int64 = 1 << 22

// Compute one row into out[off .. off + bytesPerRow), two pixels per inner loop as before.
// cr holds bytesPerRow * 8 real parts; pixels at x >= size are cleared afterwards, as the Java program pads them.
func computeRow(cr: Array<Float64>, ci: Float64, out: Array<UInt8>, off: Int64, bytesPerRow: Int64, size: Int64) {
    for (x in 0..bytesPerRow) {
        var res: UInt8 = 0
        let xb = x << 3
        var i = 0
        while (i < 8) {
            let cr1 = cr[xb + i]
            let cr2 = cr[xb + i + 1]
            var zr1 = cr1
            var zi1 = ci
            var zr2 = cr2
            var zi2 = ci
            var b: UInt8 = 0
            for (_ in 0..ITER) {
                let tr1 = zr1 * zr1
                let ti1 = zi1 * zi1
                zi1 = 2.0 * zr1 * zi1 + ci
                zr1 = tr1 - ti1 + cr1
                if (tr1 + ti1 > LIMIT) {
                    b |= 2
                    if (b == 3) {
                        break
                    }
                }
                let tr2 = zr2 * zr2
                let ti2 = zi2 * zi2
                zi2 = 2.0 * zr2 * zi2 + ci
                zr2 = tr2 - ti2 + cr2
                if (tr2 + ti2 > LIMIT) {
                    b |= 1
                    if (b == 3) {
                        break
                    }
                }
            }
            res = (res << 2) | b
            i += 2
        }
        out[off + x] = !res
    }
    let tail = size % 8
    if (tail != 0) {
        out[off + bytesPerRow - 1] &= UInt8(0xFF) << UInt8(8 - tail)
    }
}

main(args: Array<String>): Int64 {
    // for jet in vm mode, the cmd is "cj XXX.cbc -- 50000",
    // for llvmgc or aot mode in jet, the cmd is "XXX.out 50000",
    // Therefore, our expected array size is stored in args[args.size-1]
    let size = Int64.tryParse(args[args.size - 1]) ?? 0
    let out = getStdOut()
    out.write("P4\n${size} ${size}\n")
    if (size <= 0) {
        return 0
    }
    let bytesPerRow = (size + 7) / 8
    let inv = 2.0 / Float64(size)
    // One product, two uses, as in the original: with --fast-math a single-use `inv * x - 1.5` gets fused into an
    // FMA and some coordinates stop being bit-identical to the Java program. cr covers the padding pixels too.
    let cr = Array<Float64>(bytesPerRow * 8, repeat: 0.0)
    let ci = Array<Float64>(size, repeat: 0.0)
    for (x in 0..bytesPerRow * 8) {
        let t = inv * Float64(x)
        cr[x] = t - 1.5
        if (x < size) {
            ci[x] = t - 1.0
        }
    }
    let threadNum = getProcessorCount()

    let batchRows = max(1, min(size, BATCH_BYTES / bytesPerRow))
    let buffers = [Array<UInt8>(batchRows * bytesPerRow, repeat: 0), Array<UInt8>(batchRows * bytesPerRow, repeat: 0)]
    var pending = 0 // bytes of the previous batch still to be written from buffers[1 - current]
    var current = 0
    var y0 = 0
    while (y0 < size) {
        let (buf, first, rows) = (buffers[current], y0, min(batchRows, size - y0))
        let nextRow = AtomicInt64(first)
        let tasks = ArrayList<Future<Unit>>()
        for (_ in 0..threadNum) {
            tasks.add(spawn {
                var y = nextRow.fetchAdd(1)
                while (y < first + rows) {
                    computeRow(cr, ci[y], buf, (y - first) * bytesPerRow, bytesPerRow, size)
                    y = nextRow.fetchAdd(1)
                }
            })
        }
        // write the previous batch while this one is being computed
        if (pending > 0) {
            out.write(buffers[1 - current][0..pending])
        }
        for (t in tasks) {
            t.get()
        }
        pending = rows * bytesPerRow
        current = 1 - current
        y0 += rows
    }
    out.write(buffers[1 - current][0..pending])
    out.flush()
    return 0
}
