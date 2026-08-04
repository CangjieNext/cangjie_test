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
    var x1: Rune = 'A'
    var x2: Rune = 'A'
    var x3: Rune = 'A'
    var x4: Rune = 'A'
    var x5: Rune = 'A'
    var x6: Rune = 'A'
    var x7: Rune = 'A'
    var x8: Rune = 'A'
    init(inputA: Rune) {
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
    var x1: Rune = 'B'
    var x2: Rune = 'B'
    var x3: Rune = 'B'
    var x4: Rune = 'B'
    var x5: Rune = 'B'
    var x6: Rune = 'B'
    var x7: Rune = 'B'
    var x8: Rune = 'B'
    init(inputB: Rune) {
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
    let className1 = Array<A>(1000000, {i => A(Rune((i % 32767)))})
    let className2 = Array<B>(1000000, {i => B(Rune((i % 32767)))})
    var num_total = 0
    sleep(Duration.second * 1)
    num_total = num_total + className1.size + className2.size
    var endTime = DateTime.now()
    println("UnLoopAssignCharArray_MultMem: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
    println(num_total)
    return 
}