/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    let p: Int8 = -30
    let q = p << 2 // q = -120
    let r = p >> 2 // r = -8
    let r2 = p >> -2
    let x: UInt8 = 30
    let b = x << 3 // b = 240
    let b2 = x >> 1 // b2 = 15
    return 0
}
// ASSERT: scan chir_shift_length_overflow
