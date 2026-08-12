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
    var x1: Bool = true
    var x2: Bool = true
    var x3: Bool = true
    var x4: Bool = true
    var x5: Bool = true
    var x6: Bool = true
    var x7: Bool = true
    var x8: Bool = true
    init(inputA: Bool) {
        x1 = inputA
        x2 = inputA
        x3 = inputA
        x4 = inputA
        x5 = inputA
        x6 = inputA
        x7 = inputA
        x8 = inputA
    }
}

class B {
    var x1: Bool = false
    var x2: Bool = false
    var x3: Bool = false
    var x4: Bool = false
    var x5: Bool = false
    var x6: Bool = false
    var x7: Bool = false
    var x8: Bool = false
    init(inputB: Bool) {
        x1 = inputB
        x2 = inputB
        x3 = inputB
        x4 = inputB
        x5 = inputB
        x6 = inputB
        x7 = inputB
        x8 = inputB
    }
}

main() : Unit {
    var startTime = DateTime.now()
    sleep(Duration.second * 1)
    let className1 = Array<A>(1000000, {i => A(false)})
    let className2 = Array<B>(1000000, {i => B(true)})
    var num_total = 0
    sleep(Duration.second * 1)
    num_total = num_total + className1.size + className2.size
    var endTime = DateTime.now()
    println("UnLoopAssignBoolArray_MultMem: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
    println(num_total)
    return 
}