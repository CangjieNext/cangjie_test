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

var reps = 135000000

class A {
    var num: Int32 = 0

    init(num: Int32) {
        this.num = num
    }
}

func benchmarkAtomicSwapReference(): Unit {
    let x = A(1)
    var y = A(1)
    let test = AtomicReference<A>(x)
    var startTime = DateTime.now()
    for (i in 0..reps) {
        y = test.swap(x)
    }

    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    println("BenchmarkAtomicSwapReference: " + perTime.format(".2") + " ns/op")
}

main(): Int64 {
    benchmarkAtomicSwapReference()
    return 0
}
