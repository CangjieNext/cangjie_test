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
    let a: Float16 = Float16(0x53fc) * Float16(0x5bff)
    let b: Float32 = Float32(0x427f9999) * Float32(0x437FE666)
    let c: Float64 = Float64(0x404ff33333333333) * Float64(0x406ffccccccccccc)

    if (a - 16352.01 < 0.0001) {
        return 1
    }

    if (b - 16352.01 < 0.000001) {
        return 1
    }

    if (c - 16352.01 < 0.000000000000001) {
        return 1
    }

    return 0
}
