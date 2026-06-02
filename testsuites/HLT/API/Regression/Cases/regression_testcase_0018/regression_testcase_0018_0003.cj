/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %run_opt %output

import std.sync.*
import std.time.*
import std.convert.*

var reps = 230

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

func benchmarkConcurrencySubUInt64(): Unit {
    let test = AtomicUInt64(0)
    let wg = WaitGroup(0)
    wg.add(reps)

    for (i in 0..reps) {
        let thread: Future<Unit> = spawn {
            test.fetchSub(1)
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
    benchmarkConcurrencySubUInt64()
    endTime = DateTime.now()

    perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkConcurrencySubUInt64: " + perTime.format(".2") + " ns/op")
    return 0
}
