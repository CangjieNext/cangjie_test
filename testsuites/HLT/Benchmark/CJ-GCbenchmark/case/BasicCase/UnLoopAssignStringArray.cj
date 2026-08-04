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

class A {
    var x1: String = "A"
    init(inputA: String) {
        x1 = inputA
    }
}

class B {
    var x1: String = "B"
    init(inputB: String) {
        x1 = inputB
    }
}

main() : Unit {
    var startTime = DateTime.now()
    sleep(Duration.second * 1)
    let className1 = Array<A>(1000000, {i => A(i.toString())})
    let className2 = Array<B>(1000000, {i => B(i.toString())})
    var num_total = 0
    sleep(Duration.second * 1)
    num_total = num_total + className1.size + className2.size
    var endTime = DateTime.now()
    println("UnLoopAssignStringArray: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
    println(num_total)
    return 
}