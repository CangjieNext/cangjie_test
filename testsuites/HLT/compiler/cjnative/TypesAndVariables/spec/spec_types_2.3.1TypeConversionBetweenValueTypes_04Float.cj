/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main() {
    var f32Number: Float32 = 1.1
    var f64Number: Float64 = 0.0
    f64Number = Float64(f32Number) // f64Number = 1.100000023841858
    f32Number = Float32(f64Number) // f32Number = 1.1
    f64Number = 1.123456789
    f32Number = Float32(f64Number) // f32Number = 1.1234568
    f32Number = 4.4E38 // f32Number = POSITIVE_INFINITY
    f64Number = Float64(f32Number) // f64Number = POSITIVE_INFINITY
    f64Number = 4.4E38
    f32Number = Float32(f64Number) // f32Number = POSITIVE_INFINITY

    //    f64Number = f32Number*0.0
    f32Number = Float32(f64Number) // f32Number = NaN
    return 0
}
