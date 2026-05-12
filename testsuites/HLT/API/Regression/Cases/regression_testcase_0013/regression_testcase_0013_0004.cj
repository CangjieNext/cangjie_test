/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./../../../asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC-PIPE: %compiler %cmp_opt %n.cj asan.%middle -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
// TIMEOUT: 1000

import std.sync.*
import std.time.*
import std.convert.*
import asan.*

var reps: Int64 = 178
var procs: Int64 = 1
var m = Option<Monitor>.Some(Monitor())
var count = 0

func worker(n: Int64): Unit {
    if (n == 0) {
        m.getOrThrow().lock()
        count += 1
        m.getOrThrow().notify()
        m.getOrThrow().unlock()
        return
    }
    var res = spawn {
        worker(n - 1)
    }
}

func benchmarkCreateThreads(reps: Int64, procs: Int64) {
    for (i in 0..procs) {
        spawn {
            => worker(reps / procs)
        }
    }

    m.getOrThrow().lock()
    while (count < procs) {
        m.getOrThrow().wait(timeout: Duration.millisecond)
    }
    m.getOrThrow().unlock()
}

main(): Int64 {
    var startTime: DateTime
    var endTime: DateTime
    var perTime: Float64

    startTime = DateTime.now()
    benchmarkCreateThreads(reps, procs)
    endTime = DateTime.now()
    perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    print(perTime.format(".2") + " ns/op\n")
    m = None
    asanGC()
    return 0
}
