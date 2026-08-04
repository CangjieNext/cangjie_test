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

public var sum = 0

func benchmarkLoopD1() {
    let reps = 100000
    sum = 0
    var startTime = DateTime.now()
    for (i in 0..reps) {
        for (j in 0..100000) {
            sum += j / 2
        }
    }

    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkLoopD1: " + perTime.format(".2") + " ns/op")
}

func benchmarkLoopD2() {
    let reps = 100000
    sum = 0
    var startTime = DateTime.now()
    for (i in 0..reps) {
        for (j in 0..1000) {
            for (k in 0..100) {
                sum += (j + k) / 2
            }
        }
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkLoopD2: " + perTime.format(".2") + " ns/op")
}

func benchmarkLoopD3() {
    let reps = 100000
    sum = 0
    var startTime = DateTime.now()
    for (i in 0..reps) {
        for (j in 0..100) {
            for (k in 0..100) {
                for (l in 0..10) {
                    sum += (j + k + l) / 2
                }
            }
        }
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkLoopD3: " + perTime.format(".2") + " ns/op")
}

func benchmarkLoopD4() {
    let reps = 100000
    sum = 0
    var startTime = DateTime.now()
    for (i in 0..reps) {
        for (j in 0..100) {
            for (k in 0..10) {
                for (l in 0..10) {
                    for (m in 0..10) {
                        sum += (j + k + l + m) / 2
                    }
                }
            }
        }
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkLoopD4: " + perTime.format(".2") + " ns/op")
}

main(): Int64 {
    benchmarkLoopD1()
    benchmarkLoopD2()
    benchmarkLoopD3()
    benchmarkLoopD4()
    return 0
}
