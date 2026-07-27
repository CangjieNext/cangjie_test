/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

import std.time.*
import std.convert.*
import std.convert.*
import std.random.*
import std.sort.*

let ARRAY_LENGTH =[32, 256]

func generateArrD3(len: Int64): Array<Array<Array<Int64>>> {
    var array = Array<Array<Array<Int64>>>(len, { i => Array<Array<Int64>>(len, { i => Array<Int64>(len, repeat: 0) }) })
    return array
}

func randomize(arr: Array<Array<Array<Int64>>>): Array<Array<Array<Int64>>> {
    let r: Random = Random()
    for (i in 0..arr.size) {
        for (j in 0..arr[i].size) {
            for (k in 0..arr[i][j].size) {
                arr[i][j][k] = r.nextInt64()
            }
        }
    }
    return arr
}

func timeBenchmarkArraySortD3(len: Int64): Float64 {
    var startTime = DateTime.now()
    var srcArr = generateArrD3(len)

    var i = 0
    var reps = 10
    while (i < reps) {
        var srcArr1 = randomize(srcArr)
        for (j in 0..len) {
            for (k in 0..len) {
                srcArr1[j][k].sort(stable: false)
            }
        }
        i++
    }
    var endTime = DateTime.now()

    return Float64((endTime - startTime).toNanoseconds())
}

func timeBenchmarkArrayUnstableSortD3(len: Int64): Unit {
    let perTime = timeBenchmarkArraySortD3(len)
}


main(): Unit {
    var startTime = DateTime.now()
    for (i in 0..ARRAY_LENGTH.size) {
        timeBenchmarkArrayUnstableSortD3(ARRAY_LENGTH[i])
    }
    var endTime = DateTime.now()
    println("BenchmarkArraySortD3: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")

    return
}
