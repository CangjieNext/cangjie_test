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

import std.time.*
import std.convert.*
import std.convert.*


let memberLen: Array<(Int64,Int64)> = [(32,1000), (256,100), (2048,100), (16384,100)]

func timeBenchmarkWriteArrayInOrderD2(len: Int64, reps: Int64): Unit {
    var srcArr: Array<Array<Int64>> = Array<Array<Int64>>(len, repeat: Array<Int64>(len, repeat: 0))
    var writeArr: Array<Int64> = Array<Int64>(len, repeat: 0)
    var startTime = DateTime.now()
    var i = 0
    while (i < reps) {
        var j = 0
        while (j < len) {
            var k = 0
            while (k < len) {
                srcArr[j][k] = j + k 
                k = k + 1
            }
            j = j + 1
        }
        i = i + 1
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    println("BenchmarkWriteArrayInOrderD2_N${len}: ${perTime.format(".2")} ns/op")
}

main(): Int32 {
    for (i in 0..memberLen.size) {
        timeBenchmarkWriteArrayInOrderD2(memberLen[i][0],memberLen[i][1])
    }

    return 0
}
