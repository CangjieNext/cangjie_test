/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args

import stdx.encoding.json.*
import std.io.*
import std.time.*
import std.convert.*
import std.collection.*

let reps = 1000000

func setUp(): JsonInt {
    var jsonInt = JsonInt(3)
    return jsonInt
}

func benchmarkJsonInt2JsonStr(jsonInt: JsonInt) {
    for (i in 0..reps) {
        jsonInt.toJsonString()
    }
}

func timeBenchmarkJsonInt2JsonStr() {
    var jsonInt = setUp()

    var startTime = DateTime.now()
    benchmarkJsonInt2JsonStr(jsonInt)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    println("BenchmarkJsonInt2JsonStr: " + perTime.format(".2") + " ns/op")
}

main(): Int64 {
    timeBenchmarkJsonInt2JsonStr()
    return 0
}
