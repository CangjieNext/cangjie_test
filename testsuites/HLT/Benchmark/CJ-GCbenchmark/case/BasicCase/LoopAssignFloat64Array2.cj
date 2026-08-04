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
import std.collection.*
import std.sync.*
import std.runtime.*

class A {
    var x1: Float64 = 1.0
    init(inputA: Float64) {
        x1 = inputA
    }
}

class B {
    var x1: Float64 = -1.0
    init(inputB: Float64) {
        x1 = inputB
    }
}

main() : Unit {
    var startTime = DateTime.now()
    sleep(Duration.second * 1)
    let className1 = Array<A>(5000000, {i => A(Float64(i))})
    let className2 = Array<B>(5000000, {i => B(Float64(i))})
    for ( i in 0..5000000) {
        className1[i] = A(Float64(i))
        className2[i] = B(Float64(i))
    }
    var num_total = 0
    GC()
    sleep(Duration.second * 3)
    num_total = num_total + className1.size + className2.size
    var endTime = DateTime.now()
    println("LoopAssignFloat64Array2: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
    println(num_total)
    return 
}