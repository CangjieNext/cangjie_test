// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %enableCompileDebug %verbose_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan exiting...

internal import std.sync.*
internal import std.time.*
internal import std.convert.*

var reps: Int64 = 100000 // 50000 is ok
var procs: Int64 = 1
let m = Monitor()
var count = 0

func worker(n: Int64): Unit {
    if (n == 0) {
        count += 1
        m.notify()
        return
    }
    spawn {
        worker(n - 1)
    }
}

func benchmarkCreateThreads(reps: Int64, procs: Int64) {
    for (i in 0..procs) {
        spawn {
            => worker(reps / procs)
        }
    }

    m.lock()
    while (count < procs) {
        m.wait(timeout: Duration.millisecond)
    }
    m.unlock()
}

main(): Int64 {
    let startTime: DateTime
    let endTime: DateTime
    let perTime: Float64

    startTime = DateTime.now()
    benchmarkCreateThreads(reps, procs)
    endTime = DateTime.now()
    println(startTime)
    println(endTime)
    println((endTime - startTime).toNanoseconds())
    perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    println(perTime.format(".2") + " ns/op")

    println("exiting...")

    return 0
}
