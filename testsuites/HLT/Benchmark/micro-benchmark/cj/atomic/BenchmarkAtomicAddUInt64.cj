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

var reps = 180000000

func benchmarkAtomicAddUInt64() {
    let x = AtomicUInt64(0)

    for (i in 0..reps) {
        x.fetchAdd(1)
    }
}

main(): Int64 {
    var startTime: DateTime
    var endTime: DateTime
    var perTime: Float64

    startTime = DateTime.now()
    benchmarkAtomicAddUInt64()
    endTime = DateTime.now()

    perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkAtomicAddUInt64: " + perTime.format(".2") + " ns/op")
    return 0
}
