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

import std.convert.*
import std.io.*
import std.time.*
import std.convert.*
import std.collection.*

let reps = 100000
let nums = [4096, 512, 64, 8]

func setUp(num: Int64): ArrayList<String> {
    var floatArr = ArrayList<String>()
    for (i in 0..num) {
        let str = i.toString() + "." + i.toString()
        floatArr.add(str)
    }
    return floatArr
}

func benchmarkStr2Float32(floatArr: ArrayList<String>) {
    for (n in 0..reps) {
        for (i in floatArr) {
            Float32.parse(i)
        }
    }
}

func timeBenchmarkJsonArray2JsonStr(num: Int64) {
    var floatArr = setUp(num)

    var startTime = DateTime.now()
    benchmarkStr2Float32(floatArr)
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    println("BenchmarkStr2Float32" + "N" + num.toString() + ": " + perTime.format(".2") + " ns/op")
}

main(): Int64 {
    for (num in nums) {
        timeBenchmarkJsonArray2JsonStr(num)
    }
    return 0
}
