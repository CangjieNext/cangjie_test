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
open class A {
    let x1: Int64
    let x2: Int64
    let x3: Int64
    let x4: Int64
    let x5: Int64
    
    init(inputA: Int64) {
        x1 = inputA + 1
        x2 = inputA + 2
        x3 = inputA - 1
        x4 = inputA - 2
        x5 = inputA - 3
    }
}


main() : Unit {
    var startTime = DateTime.now()
    let className1 = ArrayList<A>()
    let className2 = ArrayList<A>()
    var num_total = 0

    for (j in 0..3000) {
        var num = 0
        className1.add(A(j))
        className2.add(A(j-1))
        for (i in 0..10) {
            num += (className1[j].x1 + className2[j].x1)
            num += (className1[j].x2 + className2[j].x2)
            num += (className1[j].x3 + className2[j].x3)
            num += (className1[j].x4 + className2[j].x4)
            num += (className1[j].x5 + className2[j].x5)
        }
        num_total += (num + j)
    }
    sleep(Duration.second)
    var endTime = DateTime.now()
    println("AdjustPropertiesofInnerClass: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
    println(num_total)
    return 
}