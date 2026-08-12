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
    var x1: Int64 = 1
    var x2: Int64 = -2
    var x3: Int64 = 3
    var x4: Int64 = -4
    var x5: Int64 = 5
    var array: Array<Float64> 
    init() {
        array = Array<Float64>(2048, repeat: 7.0)
    }
}

class B {
    var x1: Int64 = -1
    var x2: Int64 = 2
    var x3: Int64 = -3
    var x4: Int64 = 4
    var x5: Int64 = -5
    var array: Array<Float64>
    init() {
        array = Array<Float64>(2048, repeat: 8.0)
    }
}

main() : Unit {
    var startTime = DateTime.now()
    let className1 = ArrayList<A>()
    let className2 = ArrayList<B>()
    var num_total: Int64 = 0
    for (j in 0..3000) {
        className1.add(A())
        className2.add(B())
        var num: Int64 = 0
        for (i in 0..10) { 
            num += (className1[j].x1 + className2[j].x1)
            num += (className1[j].x2 + className2[j].x2)
            num += (className1[j].x3 + className2[j].x3)
            num += (className1[j].x4 + className2[j].x4)
            num += (className1[j].x5 + className2[j].x5)
        }
        num_total += (num + className1.size + className2.size)
    }
    sleep(Duration.second)
    var endTime = DateTime.now()
    println("AdjustInt64ArrayAttributes: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
    println(num_total)
    return 
}