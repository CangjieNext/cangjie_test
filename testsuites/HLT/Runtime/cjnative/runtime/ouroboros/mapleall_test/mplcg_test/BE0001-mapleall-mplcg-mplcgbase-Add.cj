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
// ASSERT:scan 127327672147483647-21474836513.0-3.0

import std.convert.*

func test(x: Int8, y: Int8): Unit {
    print((x + y).toString())
}

func test(x: Int16, y: Int16): Unit {
    print((x + y).toString())
}

func test(x: Int32, y: Int32): Unit {
    print((x + y).toString())
}

func test(x: Int64, y: Int64): Unit {
    print((x + y).toString())
}

func test(x: Float32, y: Float32): Unit {
    print((x + y).format(".1"))
}

func test(x: Float64, y: Float64): Unit {
    print((x + y).format(".1"))
}

main(): Int64 {
    let b1: Int8 = 126
    let b2: Int8 = 1
    let s1: Int16 = 32766
    let s2: Int16 = 1
    let i1: Int32 = 2147483646
    let i2: Int32 = 1
    let l1: Int64 = -2147483650
    let l2: Int64 = -1
    let f1: Float32 = 1.0
    let f2: Float32 = 2.0
    let d1: Float64 = -1.0
    let d2: Float64 = -2.0

    test(b1, b2)
    test(s1, s2)
    test(i1, i2)
    test(l1, l2)
    test(f1, f2)
    test(d1, d2)

    return 0
}
