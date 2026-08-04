/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// (依赖数据，性能测试时执行) RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args

import stdx.encoding.json.*
import std.fs.*
import std.time.*
import std.convert.*
import std.io.*

let reps = 100000
let dataPath = "../../script/data/json/"
//let tags = ["n8d1", "n8d2", "n8d4", "n8d8", "n64d1", "n64d2", "n64d4", "n64d8", "n512d1", "n512d2", "n512d4","n16384d32"]
let tags = ["n16384d32"]

func setUp(f: String): String {
    var fs = File(f, Read)
    var data = String.fromUtf8(readToEnd(fs))
    fs.close()
    return data
}

func benchmarkStr2JsonValue(str: String) {
     //for (i in 0..reps) {
        JsonValue.fromStr(str)
     //}
}

func timeBenchmarkStr2JsonValue(tag: String) {
    var file = dataPath + tag + ".json"
    var str = setUp(file)
    var perTime: Float64 = 0.0

    for(i in 0..reps) {
        var startTime = DateTime.now()
        benchmarkStr2JsonValue(str)
        var endTime = DateTime.now()
        var oneperTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps) / 1000.0
        //println("BenchmarkStr2JsonValue: oneperTime_" + tag + ": " + oneperTime.format(".4") + " ns/op")
        perTime = Float64(perTime) + oneperTime
    }

    var pTime = perTime / Float64(reps)

    println("BenchmarkStr2JsonValue" + tag + ": " + pTime.format(".4") + " ns/op")
}

main(): Int64 {
    for (tag in tags) {
        timeBenchmarkStr2JsonValue(tag)
    }
    return 0
}