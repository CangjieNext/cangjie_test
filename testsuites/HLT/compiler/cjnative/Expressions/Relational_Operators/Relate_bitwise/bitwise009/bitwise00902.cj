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

main(): Int64 {
    let p: Int8 = -30
    let q = p << 2
    let r = p >> 2
    let x: UInt8 = 30
    let b1 = x << Int64(3)
    let b2 = x >> Int32(1)

    if (q != -120) {
        return 1
    }
    if (r != -8) {
        return 1
    }
    if (b1 != 240) {
        return 1
    }
    if (b2 != 15) {
        return 1
    }
    return 0
}
