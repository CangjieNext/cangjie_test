/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 31305505.05.00.07.08.00.0

import std.convert.*

func test(x: Int32): Unit {
    if (x >= 0) {
        print(x.toString())
    } else {
        print((-x).toString())
    }
}

func test(x: Int64): Unit {
    if (x >= 0) {
        print(x.toString())
    } else {
        print((-x).toString())
    }
}

func test(x: Float32): Unit {
    if (x >= 0.0) {
        print(x.format(".1"))
    } else {
        print((-x).format(".1"))
    }
}

func test(x: Float64): Unit {
    if (x >= 0.0) {
        print(x.format(".1"))
    } else {
        print((-x).format(".1"))
    }
}

main(): Int64 {
    let x1: Int32 = 3
    let x2: Int32 = -13
    let x3: Int32 = 0
    let y1: Int64 = 5
    let y2: Int64 = -5
    let y3: Int64 = 0
    let z1: Float32 = 5.0
    let z2: Float32 = -5.0
    let z3: Float32 = 0.0
    let d1: Float64 = 7.0
    let d2: Float64 = -8.0
    let d3: Float64 = 0.0
    test(x1)
    test(x2)
    test(x3)
    test(y1)
    test(y2)
    test(y3)
    test(z1)
    test(z2)
    test(z3)
    test(d1)
    test(d2)
    test(d3)
    return 0
}
