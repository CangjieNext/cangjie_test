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
// ASSERT:scan 55555555345673456734567345670.3450.3450.3450.3452345678.2402345678.2402345678.2402345678.240

import std.convert.*

func select_i8_i32(i: Int8, j: Int32, k: Int32): Int32 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i16_i32(i: Int16, j: Int32, k: Int32): Int32 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i32_i32(i: Int32, j: Int32, k: Int32): Int32 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i64_i32(i: Int64, j: Int32, k: Int32): Int32 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i8_i64(i: Int8, j: Int64, k: Int64): Int64 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i16_i64(i: Int16, j: Int64, k: Int64): Int64 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i32_i64(i: Int32, j: Int64, k: Int64): Int64 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i64_i64(i: Int64, j: Int64, k: Int64): Int64 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i8_f32(i: Int8, j: Float32, k: Float32): Float32 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i16_f32(i: Int16, j: Float32, k: Float32): Float32 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i32_f32(i: Int32, j: Float32, k: Float32): Float32 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i64_f32(i: Int64, j: Float32, k: Float32): Float32 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i8_f64(i: Int8, j: Float64, k: Float64): Float64 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i16_f64(i: Int16, j: Float64, k: Float64): Float64 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i32_f64(i: Int32, j: Float64, k: Float64): Float64 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

func select_i64_f64(i: Int64, j: Float64, k: Float64): Float64 {
    if (i != 0) {
        return j
    } else {
        return k
    }
}

main(): Int64 {
    print(select_i8_i32(0, 33, 55))
    print(select_i16_i32(0, 33, 55))
    print(select_i32_i32(0, 33, 55))
    print(select_i64_i32(0, 33, 55))
    print(select_i8_i64(0, 12345, 34567))
    print(select_i16_i64(0, 12345, 34567))
    print(select_i32_i64(0, 12345, 34567))
    print(select_i64_i64(0, 12345, 34567))
    print(select_i8_f32(0, 23.2345, 0.345).format(".3"))
    print(select_i16_f32(0, 23.2345, 0.345).format(".3"))
    print(select_i32_f32(0, 23.2345, 0.345).format(".3"))
    print(select_i64_f32(0, 23.2345, 0.345).format(".3"))
    print(select_i8_f64(0, 145.345, 2345678.24).format(".3"))
    print(select_i16_f64(0, 145.345, 2345678.24).format(".3"))
    print(select_i32_f64(0, 145.345, 2345678.24).format(".3"))
    print(select_i64_f64(0, 145.345, 2345678.24).format(".3"))
    return 0
}
