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
// (LLVM) RUN-EXEC-PIPE: %export cjHeapSize=16GB && %run time %run_opt %output 55000 %run_args 1> log.txt
// (JET) RUN-EXEC-PIPE: %export JETVMPROP=-Xmx2G && time cj %run_opt %output 55000 %run_args 1> log.txt

import std.process.*
import std.math.*
import std.convert.*
import std.convert.*
import std.runtime.*

var n = 0
var nCPU = ProcessorInfo.processorCount
let EMPTY_FUTURE = spawn {}

func Times(ii: Int64, n: Int64, u: Array<Float64>, v: Array<Float64>) {
    var ul = u.size
    for (i in ii..n) {
        var vi: Float64 = 0.0
        for (j in 0..ul) {
            vi += u[j] / Float64(A(i, j))
        }
        v[i] = vi
    }
}

func TimesTransp(ii: Int64, n: Int64, u: Array<Float64>, v: Array<Float64>) {
    var ul = u.size
    for (i in ii..n) {
        var vi: Float64 = 0.0
        for (j in 0..ul) {
            vi += u[j] / Float64(A(j, i))
        }
        v[i] = vi
    }
}

func wait(threads: Array<Future<Unit>>) {
    for (i in 0..nCPU) {
        threads[i].get()
    }
}

func ATimesTransp(u: Array<Float64>, v: Array<Float64>) {
    let x = Array<Float64>(n, repeat:0.0)
    var threads: Array<Future<Unit>> = Array<Future<Unit>>(nCPU, repeat: EMPTY_FUTURE)
    for (i in 0..nCPU) {
        let ii = i * v.size / nCPU
        let n = (i + 1) * v.size / nCPU
        var f = spawn {
            Times(ii, n, u, x)
        }
        threads[i] = f
    }
    wait(threads)
    for (i in 0..nCPU) {
        let ii = i * v.size / nCPU
        let n = (i + 1) * v.size / nCPU
        var f = spawn {
            TimesTransp(ii, n, x, v)
        }
        threads[i] = f
    }
    wait(threads)
}

func A(i: Int64, j: Int64): Int64 {
    return ((i + j) * (i + j + 1) / 2 + i + 1)
}

main(args: Array<String>) {
    // for jet in vm mode, the cmd is "cj XXX.cbc -- 55000",
    // for llvmgc or aot mode in jet, the cmd is "XXX.out 55000",
    // Therefore, our expected array size is stored in args[args.size-1]
    n = Int64.tryParse(args[args.size-1])??Int64(0)
    var u = Array<Float64>(n, repeat:0.0)

    for (i in 0..n) {
        u[i] = 1.0
    }
    var v = Array<Float64>(n, repeat:0.0)

    for (i in 0.. 10) {
        ATimesTransp(u, v)
        ATimesTransp(v, u)
    }

    var vBv = 0.0
    var vv = 0.0
    for (i in 0..n) {
        vBv += u[i] * v[i]
        vv += v[i] * v[i]
    }
    println(sqrt(vBv/vv).format("9.9").toString())
}
