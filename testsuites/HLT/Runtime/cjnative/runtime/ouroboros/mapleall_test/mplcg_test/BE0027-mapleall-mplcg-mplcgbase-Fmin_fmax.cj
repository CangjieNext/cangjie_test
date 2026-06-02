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
// ASSERT:scan 5.0-5.0-7.2-7.0-5.0-5.22.22.25.0-5.0-5.0-5.22.22.25.05.25.0-5.0-7.2-7.0-5.0-5.22.22.25.0-5.0-5.0-5.22.22.25.05.2

import std.convert.*

func fmin_f32(f0: Float32, f1: Float32): Float32 {
    if (f0 < f1) {
        return f0
    } else {
        return f1
    }
}

func fmin_f64(f0: Float64, f1: Float64): Float64 {
    if (f0 < f1) {
        return f0
    } else {
        return f1
    }
}

func fmax_f32(f0: Float32, f1: Float32): Float32 {
    if (f0 > f1) {
        return f0
    } else {
        return f1
    }
}

func fmax_f64(f0: Float64, f1: Float64): Float64 {
    if (f0 > f1) {
        return f0
    } else {
        return f1
    }
}

main(): Int64 {
    print(fmin_f32(5.0, 5.0).format(".1"))
    print(fmin_f32(-5.0, -5.0).format(".1"))
    print(fmin_f32(-5.0, -7.2).format(".1"))
    print(fmin_f32(-7.0, -5.2).format(".1"))
    print(fmin_f32(-5.0, 2.2222).format(".1"))
    print(fmin_f32(2.2, -5.2).format(".1"))
    print(fmin_f32(5.0, 2.2222).format(".1"))
    print(fmin_f32(2.2, 5.2).format(".1"))

    print(fmax_f32(5.0, 5.0).format(".1"))
    print(fmax_f32(-5.0, -5.0).format(".1"))
    print(fmax_f32(-5.0, -7.2).format(".1"))
    print(fmax_f32(-7.0, -5.2).format(".1"))
    print(fmax_f32(-5.0, 2.2222).format(".1"))
    print(fmax_f32(2.2, -5.2).format(".1"))
    print(fmax_f32(5.0, 2.2222).format(".1"))
    print(fmax_f32(2.2, 5.2).format(".1"))

    print(fmin_f64(5.0, 5.0).format(".1"))
    print(fmin_f64(-5.0, -5.0).format(".1"))
    print(fmin_f64(-5.0, -7.2).format(".1"))
    print(fmin_f64(-7.0, -5.2).format(".1"))
    print(fmin_f64(-5.0, 2.2222).format(".1"))
    print(fmin_f64(2.2, -5.2).format(".1"))
    print(fmin_f64(5.0, 2.2222).format(".1"))
    print(fmin_f64(2.2, 5.2).format(".1"))

    print(fmax_f64(5.0, 5.0).format(".1"))
    print(fmax_f64(-5.0, -5.0).format(".1"))
    print(fmax_f64(-5.0, -7.2).format(".1"))
    print(fmax_f64(-7.0, -5.2).format(".1"))
    print(fmax_f64(-5.0, 2.2222).format(".1"))
    print(fmax_f64(2.2, -5.2).format(".1"))
    print(fmax_f64(5.0, 2.2222).format(".1"))
    print(fmax_f64(2.2, 5.2).format(".1"))

    return 0
}
