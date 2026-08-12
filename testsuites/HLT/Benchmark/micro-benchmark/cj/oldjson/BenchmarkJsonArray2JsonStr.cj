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

let reps = 100000
let nums = [4096, 512, 64, 8]

func setUp(num: Int64): JsonArray {
    var buf = ArrayList<JsonValue>()
    for (i in 0..num) {
        buf.add(JsonInt(i))
    }
    var jsonArray = JsonArray(buf)
    return jsonArray
}

func benchmarkJsonArray2JsonStr(jsonArr: JsonArray) {
    for (i in 0..reps) {
        jsonArr.toJsonString()
    }
}

func timeBenchmarkJsonArray2JsonStr(num: Int64) {
    var jsonArray = setUp(num)

    var startTime = DateTime.now()
    benchmarkJsonArray2JsonStr(jsonArray)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    println("BenchmarkJsonArray2JsonStr" + "N" + num.toString() + ": " + perTime.format(".2") + " ns/op")
}

main(): Int64 {
    for (num in nums) {
        timeBenchmarkJsonArray2JsonStr(num)
    }
    return 0
}
