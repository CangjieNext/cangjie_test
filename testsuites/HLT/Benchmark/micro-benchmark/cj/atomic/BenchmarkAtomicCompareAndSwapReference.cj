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

var reps = 65000000

class A {
    var num: Int32 = 0

    init(num: Int32) {
        this.num = num
    }
}

func benchmarkAtomicCompareAndSwapReference(): Unit {
    var u:A = A(0)
    var v:A = A(1)
    let test = AtomicReference<A>(u)

    var startTime = DateTime.now()
    for (i in 0..reps) {
        test.compareAndSwap(u, v)
        test.compareAndSwap(v, u)
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    println("BenchmarkAtomicCompareAndSwapReference: " + perTime.format(".2") + " ns/op")
}

main(): Int64 {
    benchmarkAtomicCompareAndSwapReference()
    return 0
}
