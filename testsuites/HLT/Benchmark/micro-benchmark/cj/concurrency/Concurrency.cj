/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*
import std.convert.*

func concurrencyBenchmark(testName: String, testFunc: (Int64, Int64) -> Unit, rep: Int64, threads: Int64): Unit {
    var startTime: DateTime
    var endTime: DateTime
    var perTime: Float64

    startTime = DateTime.now()
    testFunc(rep, threads)
    endTime = DateTime.now()

    perTime = Float64((endTime - startTime).toNanoseconds()) / Float64(rep)
    println("Benchmark${testName}Thread${threads}: " + perTime.format(".2") + " ns/op")
}
