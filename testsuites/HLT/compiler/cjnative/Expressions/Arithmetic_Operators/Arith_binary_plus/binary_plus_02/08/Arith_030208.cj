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
    let a: Float16 = Float16(0x65fd) + Float16(0x7bdf)
    let b: Float32 = Float32(0x447fcccc) + Float32(0x477be0cc)
    let c: Float64 = Float64(0x408ff99980000000) + Float64(0x40ef7c1999999999)

    if (57824.0 - a > 0.001) {
        return 1
    }

    if (2348527104.0 - b > 0.001) {
        return 1
    }

    if (9331306365024049152.0 - c > 0.001) {
        return 1
    }

    return 0
}
