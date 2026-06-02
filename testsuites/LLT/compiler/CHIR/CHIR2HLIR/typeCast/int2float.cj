// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var i8a: Int8 = -128
    var i8b: Int8 = 127
    var i16a: Int16 = -32768
    var i16b: Int16 = 32767
    var i32a: Int32 = -2147483648
    var i32b: Int32 = 2147483647

    // Int8 ->f16, Int16 ->f16, Int32 ->f16, Int64 ->f16,

    // Int8 ->f32, Int16 ->f32, Int32 ->f32, Int64 ->f32
    var ret3 = Float64(i8a) + Float64(i8b) + Float64(i16a) + Float64(i16b) + 2.0
    if (ret3 + 0.001 < 0.0 || ret3 > 0.001) {
        return 4
    }
    var ret4 = Float64(i32a) + Float64(i32b) + Float64(Int64(i32a)) + Float64(Int64(i32b)) + 2.0
    if (ret4 + 0.001 < 0.0 || ret4 > 0.001) {
        return 5
    }
    // Int8 ->f64, Int16 ->f64, Int32 ->f64, Int64 ->f64
    var ret5 = Float64(i8a) + Float64(i8b) + Float64(i16a) + Float64(i16b) + 2.0
    if (ret5 + 0.001 < 0.0 || ret5 > 0.001) {
        return 6
    }
    var ret6 = Float64(i32a) + Float64(i32b) + 1.0
    if (ret6 + 0.001 < 0.0 || ret6 > 0.001) {
        return 7
    }
    return 0
}
