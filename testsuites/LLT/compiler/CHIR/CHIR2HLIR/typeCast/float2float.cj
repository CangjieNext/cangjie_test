// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var f32a: Float32 = -3.4e38
    var f32b: Float32 = 3.4e38
    var f64a: Float64 = -1.797693134862315e308
    var f64b: Float64 = 1.797693134862315e308

    // Float extend.
    // f16->f64,f32->f64,f64->f64
    var ret2 = Float64(f32a) + Float64(f32b)
    var ret3 = Float64(f64a) + Float64(f64b)
    if (ret2 > 0.001 || ret2 + 0.001 < 0.0) {
        return 2
    }
    if (ret3 > 0.001 || ret3 + 0.001 < 0.0) {
        return 3
    }
    // f16->f32,f32->f32,f64->f32
    var ret5 = Float32(f32a) + Float32(f32b)
    var ret6 = Float32(Float64(f32a)) + Float32(Float64(f32b))
    if (ret5 > 0.001 || ret5 + 0.001 < 0.0) {
        return 5
    }
    if (ret6 > 0.001 || ret6 + 0.001 < 0.0) {
        return 6
    }
    // f16->f16,f32->f16,f64->f16

    //Float cut off.
    // f64->f16 ,f32->f16

    // f64->f32
    var ret11 = Float32(Float64(f32a)) + Float32(Float64(f32b))
    if (ret11 > 0.001 || ret11 + 0.001 < 0.0) {
        return 11
    }
    return 0
}
