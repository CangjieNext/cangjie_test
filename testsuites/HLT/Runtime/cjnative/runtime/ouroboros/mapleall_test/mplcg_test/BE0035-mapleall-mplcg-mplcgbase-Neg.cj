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
// ASSERT:scan -733-286331153-127-69905-127.0073.731.24-127.1373.741.28

import std.convert.*

func neg_i32(i: Int32): Int32 {
    return -i
}

func neg_i32_one_of_many(i0: Int32, j0: Int32, k0: Int32, i1: Int32, j1: Int32, k1: Int32): Int32 {
    return -j0
}

func neg_i32_imm(i0: Int32, j0: Int32, k0: Int32): Int32 {
    return -Int32(0x11111111)
}

func neg_i64(i0: Int64, j0: Int64, k0: Int64): Int64 {
    return -i0
}

func neg_i64_imm(i0: Int64, j0: Int64, k0: Int64): Int64 {
    return -Int64(0x11111)
}

func neg_f32(f: Float32): Float32 {
    return -f
}

func neg_f32_imm(f: Float32): Float32 {
    return -(-1.24)
}

func neg_f64(f: Float64): Float64 {
    return -f
}

func neg_f64_imm(f: Float64): Float64 {
    return -(-1.28)
}

main(): Int64 {
    print(neg_i32(7))
    print(neg_i32(-3))
    print(neg_i32_one_of_many(0, -3, -8, 3, 4, 5))
    print(neg_i32_imm(7, -3, -8))

    print(neg_i64(127, -7373, 102384))
    print(neg_i64_imm(7, -3, -8))

    print(neg_f32(127.0).format(".2"))
    print(neg_f32(-73.73).format(".2"))
    print(neg_f32_imm(-4.27).format(".2"))

    print(neg_f64(127.127).format(".2"))
    print(neg_f64(-73.7372).format(".2"))
    print(neg_f64_imm(-4.272727).format(".2"))

    return 0
}
