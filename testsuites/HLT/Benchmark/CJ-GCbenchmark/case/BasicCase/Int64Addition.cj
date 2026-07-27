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
import std.sync.*
class A {
    let x1: Int64 = 1
    let x2: Int64 = -2
    let x3: Int64 = 3
    let x4: Int64 = -4
    let x5: Int64 = 5
    let array: Array<Float64> 
    init() {
        array = Array<Float64>(2048, repeat: 7.0)
    }
}

class B {
    let x1: Int64 = -1
    let x2: Int64 = 2
    let x3: Int64 = -3
    let x4: Int64 = 4
    let x5: Int64 = -5
    let array: Array<Float64>
    init() {
        array = Array<Float64>(2048, repeat: 8.0)
    }
}

main() : Unit {
    var startTime = DateTime.now()
    var num_total: Int64 = 0
    for (j in 0..100000) {
        let a = A()
        let b = B()
        var num: Int64 = 0
        for (i in 0..10000) { 
            num += (a.x1 + b.x1)
            num += (a.x2 + b.x2)
            num += (a.x3 + b.x3)
            num += (a.x4 + b.x4)
            num += (a.x5 + b.x5)
        }
        num_total += (num + j)
    }
    sleep(Duration.second)
    var endTime = DateTime.now()
    println("Int64Addition: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
    println(num_total)
    return 
}