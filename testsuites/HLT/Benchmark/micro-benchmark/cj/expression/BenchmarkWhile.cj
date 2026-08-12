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

func benchmarkWhileD1() {
    let reps = 100000
    var n = 0
    sum = 0
    var startTime = DateTime.now()
    for (i in 0..reps) {
        n = 0
        while (n < 100000) {
            n++
            sum += n / 2
        }
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkWhileD1: " + perTime.format(".3") + " ns/op")
}

func benchmarkWhileD2() {
    let reps = 100000
    var m = 0
    var n = 0
    sum = 0
    var startTime = DateTime.now()
    for (i in 0..reps) {
        n = 0
        while (n < 1000) {
            n++
            m = 0
            while (m < 100) {
                m++
                sum += (n + m) / 2
            }
        }
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkWhileD2: " + perTime.format(".3") + " ns/op")
}

func benchmarkWhileD3() {
    let reps = 100000
    var m = 0
    var n = 0
    var j = 0
    sum = 0
    var startTime = DateTime.now()
    for (i in 0..reps) {
        n = 0
        while (n < 100) {
            n++
            m = 0
            while (m < 100) {
                m++
                j = 0
                while (j < 10) {
                    j++
                    sum += (n + m + j) / 2
                }
            }
        }
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkWhileD3: " + perTime.format(".3") + " ns/op")
}

func benchmarkWhileD4() {
    let reps = 100000
    var m = 0
    var n = 0
    var j = 0
    var k = 0
    sum = 0
    var startTime = DateTime.now()
    for (i in 0..reps) {
        n = 0
        while (n < 100) {
            n++
            m = 0
            while (m < 10) {
                m++
                j = 0
                while (j < 10) {
                    j++
                    k = 0
                    while (k < 10) {
                        k++
                        sum += (n + m + j + k) / 2
                    }
                }
            }
        }
    }
    var endTime = DateTime.now()
    var perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(reps)
    println("BenchmarkWhileD4: " + perTime.format(".3") + " ns/op")
}

main(): Int64 {
    benchmarkWhileD1()
    benchmarkWhileD2()
    benchmarkWhileD3()
    benchmarkWhileD4()
    return 0
}
