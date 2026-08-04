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

func partial(n: Int64): Float64 {
    var a1 = 0.0
    var a2 = 0.0
    var a3 = 0.0
    var a4 = 0.0
    var a5 = 0.0
    var a6 = 0.0
    var a7 = 0.0
    var a8 = 0.0
    var a9 = 0.0
    let twothirds = 2.0 / 3.0
    var alt = -1.0
    var k2 = 0.0
    var k3 = 0.0
    var sk = 0.0
    var ck = 0.0
    for (k in 1..=n) {
        k2 = Float64(k * k)
        k3 = k2 * Float64(k)
        sk = sin(Float64(k))
        ck = cos(Float64(k))
        alt = -alt

        a1 += pow(twothirds, Float64(k - 1))
        a2 += pow(Float64(k), -0.5)
        a3 += 1.0 / (Float64(k) * (Float64(k) + 1.0))
        a4 += 1.0 / (k3 * sk * sk)
        a5 += 1.0 / (k3 * ck * ck)
        a6 += 1.0 / Float64(k)
        a7 += 1.0 / k2
        a8 += alt / Float64(k)
        a9 += alt / (2.0 * Float64(k) - 1.0)
    }
    // NOTE: We don't try to validate anything from pow(),  sin() or cos() because those aren't
    // well-specified in ECMAScript.
    return a6 + a7 + a8 + a9
}

/*
 *  @State
 *  @Tags Jetstream2
 */
class Benchmark {
    func run() {
        var total = 0.0
        var n = 1024
        while (n <= 16384) {
            total = total + partial(n)
            n = n * 2
        }
        let expected = 60.08994194659945
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
        println("math-partial-sums: ms = ${Float64(duration.toNanoseconds())/1000000.0}")
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
