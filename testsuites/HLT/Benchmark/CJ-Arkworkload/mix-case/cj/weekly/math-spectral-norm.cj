/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms
import std.time.*
import std.collection.*
import std.math.*

func A(i: Int64, j: Int64): Float64 {
    let result = (i + j) * (i + j + 1) / 2 + i + 1
    return 1.0 / Float64(result)
}

func Au(u: ArrayList<Float64>, v: ArrayList<Float64>) {
    for (i in 0..u.size) {
        var t = 0.0
        for (j in 0..u.size) {
            t += A(i, j) * u[j]
        }
        v[i] = t
    }
}

func Atu(u: ArrayList<Float64>, v: ArrayList<Float64>) {
    for (i in 0..u.size) {
        var t = 0.0
        for (j in 0..u.size) {
            t += A(j, i) * u[j]
        }
        v[i] = t
    }
}

func AtAu(u: ArrayList<Float64>, v: ArrayList<Float64>, w: ArrayList<Float64>) {
    Au(u, w)
    Atu(w, v)
}

func spectralnorm(n: Int64): Float64 {
    var u = ArrayList<Float64>()
    var v = ArrayList<Float64>()
    var w = ArrayList<Float64>()
    var vv = 0.0
    var vBv = 0.0

    for (_ in 0..n) {
        u.add(1.0)
        v.add(0.0)
        w.add(0.0)
    }
    for (_ in 0..10) {
        AtAu(u, v, w)
        AtAu(v, u, w)
    }

    for (i in 0..n) {
        vBv += u[i] * v[i]
        vv += v[i] * v[i]
    }
    return sqrt(Float64(vBv / vv))
}

/*
 *  @State
 *  @Tags Jetstream2
 */
class Benchmark {
    func run() {
        var total = 0.0
        var n = 6
        while (n <= 48) {
            total = total + spectralnorm(n)
            n = n * 2
        }
        let expected = 5.086694231303284
        if (total != expected) {
            println("ERROR: bad result: expected ${expected} but got ${total}")
        }
    }
	/**
    * @Benchmark
    */
    func runIterationTime() {
        let start = Timer().getTime()
        for (_ in 0..80) {
            run()
        }
        let end = Timer().getTime()
        let duration = end - start
        println("math-spectral-norm: ms = ${Float64(duration.toNanoseconds())/1000000.0}")
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

main() {
    Benchmark().runIterationTime()
}
