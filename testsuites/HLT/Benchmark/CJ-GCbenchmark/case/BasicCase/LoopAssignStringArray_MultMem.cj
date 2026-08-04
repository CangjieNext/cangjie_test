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
    var x2: String = "A"
    var x3: String = "A"
    var x4: String = "A"
    var x5: String = "A"
    var x6: String = "A"
    var x7: String = "A"
    var x8: String = "A"
    init(inputA: String) {
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
    var x1: String = "B"
    var x2: String = "B"
    var x3: String = "B"
    var x4: String = "B"
    var x5: String = "B"
    var x6: String = "B"
    var x7: String = "B"
    var x8: String = "B"
    init(inputB: String) {
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
    let className1 = Array<A>(1000000, {i => A(i.toString())})
    let className2 = Array<B>(1000000, {i => B(i.toString())})
    for ( i in 0..1000000) {
        className1[i] = A(i.toString())
        className2[i] = B(i.toString())
    }
    var num_total = 0
    sleep(Duration.second * 1)
    num_total = num_total + className1.size + className2.size
    var endTime = DateTime.now()
    println("LoopAssignStringArray_MultMem: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
    println(num_total)
    return 
}