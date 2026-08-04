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

let step: Int64 = 64


let memberLen: Array<(Int64, Int64)> = [(32, 1000000), (256, 1000000)]

func timeBenchmarkWriteArrayOutOfOrderD3(len: Int64, reps: Int64, step: Int64): Unit {
    var targetArrD2: Array<Array<Int64>> = Array<Array<Int64>>(len, repeat: Array<Int64>(len, repeat: 0))
    var targetArrD3: Array<Array<Array<Int64>>> = Array<Array<Array<Int64>>>(len, repeat: targetArrD2)
    var startTime = DateTime.now()
    var i = 0
    while (i < reps) {
        var j = 0
        while (j < len) {
            var k = 0
            while (k < len) {
                var n = 0
                while (n < len) {
                    targetArrD3[j][k][n] = j + k - n
                    n = n + step
                }
                k = k + step
            }
            j = j + step
        }
        i = i + 1
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)

    println("BenchmarkWriteArrayOutOfOrderD3_N${len}: ${perTime.format(".2")} ns/op")
}

main(): Int32 {
    for (i in 0..memberLen.size) {
        timeBenchmarkWriteArrayOutOfOrderD3(memberLen[i][0],memberLen[i][1], step)
    }

    return 0
}
