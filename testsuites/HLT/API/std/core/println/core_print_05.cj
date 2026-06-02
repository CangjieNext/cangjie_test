/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args  | compare %f
// ASSERT: scan-begin 1.000000
// ASSERT: scan-next 10.000000
// ASSERT: scan-next 100.000000
// ASSERT: scan-next 1.00000010.000000100.000000
// ASSERT: scan-end

import std.collection.*
import std.math.*

main() {
    let f16: Float16 = 1.0
    let f32: Float32 = 10.0
    let f64: Float64 = 100.0
    println(f16)
    println(f32)
    println(f64)
    print(f16, flush: true)
    print(f32, flush: false)
    print(f64, flush: false)
}
