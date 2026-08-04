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

import std.time.*
import std.convert.*
import std.convert.*
import std.random.*
import std.sort.*

let ARRAY_LENGTH =[32, 256, 2048]
let TIMEOUT = Duration.second // timeout 1s

func generateArrD2(len: Int64): Array<Array<Int64>> {
    return Array<Array<Int64>>(len, { i => Array<Int64>(len, repeat: 0) })
}

func randomize(arr: Array<Array<Int64>>): Unit {
    let r: Random = Random()
    for (i in 0..arr.size) {
        for (j in 0..arr[i].size) {
            arr[i][j] = r.nextInt64()
        }
    }
}

func timeBenchmarkArraySortDescendingD2(len: Int64): Unit {
    var totalCostTime = Duration.Zero
    var srcArr: Array<Array<Int64>> = generateArrD2(len)

    var (i, reps, step) = (0, 1, 1)
    while (i < reps) {
        randomize(srcArr)
        var startTime = DateTime.now()
        for (j in 0..len) {
            srcArr[j].sortDescending(stable: true)
        }
        totalCostTime += DateTime.now() - startTime

        i++
        if (i == reps && totalCostTime < TIMEOUT) {
            reps += step
            step *= 2
        }
    }

    var perTime = Float64(totalCostTime.toNanoseconds()) / Float64(reps)
    println("BenchmarkArraySortDescendingD2_N${len}: ${perTime.format(".2")} ns/op")
}

main(): Int32 {
    for (i in 0..ARRAY_LENGTH.size) {
        timeBenchmarkArraySortDescendingD2(ARRAY_LENGTH[i])
    }

    return 0
}
