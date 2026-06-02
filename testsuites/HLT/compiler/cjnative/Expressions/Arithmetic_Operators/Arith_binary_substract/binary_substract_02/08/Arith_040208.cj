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
    let a: Float16 = Float16(0xe3ff - 0x7bdf)
    let b: Float32 = Float32(0xc47fcccc - 0x477be0cc)
    let c: Float64 = Float64(0x7FA07D8000000000)

    if (-a - (-26656.0) > 0.1) {
        return 1
    }

    if (-b - (-2097409024.0) > 0.1) {
        return 1
    }

    if (-c - (-9196488427799838720.0) > 0.1) {
        return 1
    }

    return 0
}
