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

var Float16_MIN: Float16 = 2e-149
var Float16_Max: Float16 = (2e1 - (2e-23)) * 2e127
var a2: Array<Float16> = [Float16_MIN, Float16_MIN + 0.000001, -1.0, 0.0, 1.0, 31.0, 32.0, 100.0, Float16_Max - 1.0,
    Float16_Max]
var a2s: Array<String> = ["0.00000", "0.000001", "-1.0", "0.0", "1.0", "31.0", "32.0", "100.0", "inf", "inf"]
var Float32_MIN: Float32 = 2e-149
var Float32_Max: Float32 = (2e1 - 2e-23) * 2e127
var a3: Array<Float32> = [Float32_MIN, Float32_MIN + 0.000001, -1.0, 0.0, 1.0, 31.0, 32.0, 100.0, Float32_Max - 1.0,
    Float32_Max]
var a3s: Array<String> = ["0.00000", "0.000001", "-1.0", "0.0", "1.0", "31.0", "32.0", "100.0", "inf", "inf"]
var Float64_MIN: Float64 = 2e-1074
var Float64_Max: Float64 = (2e1 - (2e-52)) * 2e1023
var a4: Array<Float64> = [Float64_MIN, Float64_MIN + 0.000001, -1.0, 0.0, 1.0, 31.0, 32.0, 100.0, Float64_Max - 1.0,
    Float64_Max]
var a4s: Array<String> = ["0.00000", "0.000001", "-1.0", "0.0", "1.0", "31.0", "32.0", "100.0", "inf", "inf"]

main(): Int64 {
    for (item in 0..a2.size) {
        if (!a2.get(item).getOrThrow().toString().contains(a2s.get(item).getOrThrow())) {
            return 2
        }
    }
    for (item in 0..a3.size) {
        if (!a3.get(item).getOrThrow().toString().contains(a3s.get(item).getOrThrow())) {
            return 3
        }
    }
    for (item in 0..a4.size) {
        if (!a4.get(item).getOrThrow().toString().contains(a4s.get(item).getOrThrow())) {
            return 4
        }
    }
    return 0
}
