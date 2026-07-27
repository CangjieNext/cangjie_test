/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (LLVM) EXEC: %compiler %cmp_opt %optimization_level_2 --fast-math %overflow_wrapping %f -o %output
// (JET) EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (LLVM) RUN-EXEC-PIPE: %export cjHeapSize=16GB && %run time %run_opt %output 50000 %run_args 1> log.txt
// (JET) RUN-EXEC-PIPE: %export JETVMPROP=-Xmx2G && time cj %run_opt %output 50000 %run_args 1> log.txt

import std.io.*
import std.fs.*
import std.sync.*
import std.convert.*
import std.collection.ArrayList
import std.runtime.*

let LIMIT = 4.0
let ITER = 50
let yAt: AtomicInt32 = AtomicInt32(0)
var size: Int64 = 200000
var bytesPerRow: Int64 = 0
var field: Array<UInt8> = Array<UInt8>(0, repeat:0)
var fields: Array<Array<UInt8>> = Array<Array<UInt8>>(0, repeat:field)
var initial_r: Array<Float64> = Array<Float64>(0, repeat:0.0)
var initial_i: Array<Float64> = Array<Float64>(0, repeat:0.0)

func computeRow(y0: Int32) {
    var xb: Int64
    var (res, b): (UInt8,UInt8)
    var (Zr1, Zr2, Zi1, Zi2, Tr1, Tr2, Ti1, Ti2, Cr1, Cr2): (Float64,Float64,Float64,Float64,Float64,Float64,Float64,Float64,Float64,Float64)
    var field: Array<UInt8> = Array<UInt8>(bytesPerRow, repeat:0)
    for (x in 0..bytesPerRow) {
        res = 0
        var Ci = initial_i[Int64(y0)]
        var i = 0
        while (i < 8) {
            xb = x << 3
            Cr1 = initial_r[xb + i]
            Cr2 = initial_r[xb + i + 1]
            Zr1 = Cr1
            Zi1 = Ci
            Zr2 = Cr2
            Zi2 = Ci
            b = 0
            for (j in 0..ITER) {
                Tr1 = Zr1 * Zr1
                Ti1 = Zi1 * Zi1
                Zi1 = 2.0 * Zr1 * Zi1 + Ci
                Zr1 = Tr1 - Ti1 + Cr1
                if (Tr1 + Ti1 > LIMIT) {
                    b |= 2
                    if (b == 3) {
                        break
                    }
                }
                Tr2 = Zr2 * Zr2
                Ti2 = Zi2 * Zi2
                Zi2 = 2.0 * Zr2 * Zi2 + Ci
                Zr2 = Tr2 - Ti2 + Cr2
                if (Tr2 + Ti2 > LIMIT) {
                    b |= 1
                    if (b == 3) {
                        break
                    }
                }
            }
            res = (res << 2) | b
            i += 2
        }
        field[x] = !res
    }
    return field
}

func computeRows(s32: Int32) {
    var y = yAt.fetchAdd(1)
    while (y < s32) {
        fields[Int64(y)] = computeRow(y)
        y = yAt.fetchAdd(1)
    }
}

main(args: Array<String>) {
    // for jet in vm mode, the cmd is "cj XXX.cbc -- 50000",
    // for llvmgc or aot mode in jet, the cmd is "XXX.out 50000",
    // Therefore, our expected array size is stored in args[args.size-1]
    size = Int64.tryParse(args[args.size-1])??Int64(0)
    bytesPerRow = size >> 3
    field = Array<UInt8>(bytesPerRow, repeat:0)
    fields = Array<Array<UInt8>>(size, repeat:field)
    initial_r = Array<Float64>(size, repeat:0.0)
    initial_i = Array<Float64>(size, repeat:0.0)

    var pool: Int64 = ProcessorInfo.processorCount
    var threads: ArrayList<Future<Unit>> = ArrayList<Future<Unit>>()
    var inv = 2.0 / Float64(size)
    for (xy in 0..size) {
        var i = inv * Float64(xy)
        initial_r[xy] = i - 1.5
        initial_i[xy] = i - 1.0
    }
    for (i in 0..pool) {
        var future: Future<Unit> = spawn {
            computeRows(Int32(size))
        }
        threads.add(future)
    }
    for (i in 0..pool) {
        var res = threads[i].get()
    }
    var f: File = File("/dev/stdout", Write)
    var bos: BufferedOutputStream<File> = BufferedOutputStream(f)
    bos.write(unsafe {"P4\n${size} ${size}\n".rawData()})
    for (y in 0..size) {
        bos.write(fields[y].slice(0, bytesPerRow))
    }
    bos.flush()
    f.close()
    return 0
}
