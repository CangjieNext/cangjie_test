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
    let x1: Int64 = 1
    let x2: Int64 = -2
    let x3: Int64 = 3
    let x4: Int64 = -4
    let x5: Int64 = 5
    let arrayA: Array<Float64>
    init() {
        arrayA = Array<Float64>(1024, repeat: 7.0)
    }
}

open class B <: A{
    let arrayB: Array<Float64>
    init() {
        arrayB = Array<Float64>(1024, repeat: 8.0)
    }
}

open class C <: B{
    let arrayC: Array<Float64>
    init() {
        arrayC = Array<Float64>(1024, repeat: 9.0)
    }
}

open class D <: C{
    let arrayD: Array<Float64>
    init() {
        arrayD = Array<Float64>(1024, repeat: 10.0)
    }
}

open class E <: D{
    let arrayE: Array<Float64>
    init() {
        arrayE = Array<Float64>(1024, repeat: 11.0)
    }
}

main() : Unit {
    var startTime = DateTime.now()
    var num_total = 0
    for (j in 0..100000) {
        let d = D()
        let e = E()
        var num = 0
        for (i in 0..10000) { 
            num += (d.x1 + e.x1)
            num += (d.x2 + e.x2)
            num += (d.x3 + e.x3)
            num += (d.x4 + e.x4)
            num += (d.x5 + e.x5)
        }
        num_total += (num + j)
    }
    sleep(Duration.second * 1)
    var endTime = DateTime.now()
    println("InheritanceAndInt64Addition: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
    println(num_total)
    return 
}