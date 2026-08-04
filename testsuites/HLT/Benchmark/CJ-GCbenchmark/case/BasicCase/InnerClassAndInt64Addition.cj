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
import std.random.*

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
    let buffer = Random()
    var num_total = 0
    for (k in 0..10) {
        for (j in 0..100000) {
            let d = A(buffer.nextInt64(5))
            let e = A(buffer.nextInt64(5))
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
    }
    var endTime = DateTime.now()
    println("InnerClassAndInt64Addition: ms = ${Float64((endTime - startTime).toNanoseconds()) / 1000000.0}")
    println(num_total)
    return 
}