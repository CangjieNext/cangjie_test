/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args

import std.sync.*
import std.time.*
import std.convert.*

var reps = 1000

class WaitGroup {
    var m: Monitor = Monitor()
    private var cnt: Int64

    public init(cnt: Int64) {
        this.cnt = cnt
    }

    public func add(n: Int64) {
        m.lock()
        cnt += n
        if (cnt == 0) {
            m.notifyAll()
        } else if (cnt < 0) {
            throw Exception("negative WaitGroup counter")
        }
        m.unlock()
    }

    public func done() {
        this.add(-1)
    }

    public func wait() {
        m.lock()
        while (cnt > 0) {
            m.wait()
        }
        m.unlock()
    }
}

func benchmarkConcurrencyLoadInt64(): Unit {
    let test = AtomicInt64(0)
    let wg = WaitGroup(0)
    wg.add(reps)

    for (i in 0..reps) {
        let thread: Future<Unit> = spawn {
            for (j in 0..10000) {
                test.load()
            }
            wg.done()
        }
    }
    wg.wait()
}

main(): Int64 {
    var startTime: DateTime
    var endTime: DateTime
    var perTime: Float64

    startTime = DateTime.now()
    benchmarkConcurrencyLoadInt64()
    endTime = DateTime.now()

    perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkConcurrencyLoadInt64: " + perTime.format(".2") + " ns/op")
    return 0
}
