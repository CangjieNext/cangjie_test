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
// ASSERT:scan 332223

import std.math.*

func round_f32_i32(f1: Float32): Int32 {
    if ((f1 - trunc(f1)) < 0.5) {
        return Int32(floor(f1))
    } else {
        return Int32(ceil(f1))
    }
}

func round_f64_i64(d1: Float64): Int64 {
    if ((d1 - trunc(d1)) < 0.5) {
        return Int64(floor(d1))
    } else {
        return Int64(ceil(d1))
    }
}

func ceil_f32_i32(): Int32 {
    let f1: Float32 = 2.3
    return Int32(ceil(f1))
}

func ceil_f64_i64(): Int64 {
    let d1: Float64 = 2.8
    return Int64(ceil(d1))
}

func floor_f32_i32(): Int32 {
    let f1: Float32 = 2.3
    return Int32(floor(f1))
}

func floor_f64_i64(): Int64 {
    let d1: Float64 = 2.8
    return Int64(floor(d1))
}

func round_f32_i32(): Int32 {
    let i1: Int32 = round_f32_i32(2.3)
    return i1
}

func round_f64_i64(): Int64 {
    let l1: Int64 = round_f64_i64(2.8)
    return l1
}

main(): Int64 {
    print(ceil_f32_i32())
    print(ceil_f64_i64())

    print(floor_f32_i32())
    print(floor_f64_i64())

    print(round_f32_i32())
    print(round_f64_i64())

    return 0
}
