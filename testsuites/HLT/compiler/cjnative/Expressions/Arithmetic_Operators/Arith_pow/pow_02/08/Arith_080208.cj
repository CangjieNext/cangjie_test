/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    let a: Float16 = Float16(0x4100 ** 0x59cc)
    let b: Float32 = Float32(0x40200000 ** 0x41399999)
    let c: Float64 = Float64(0x4004000000000000 ** 0x4027333333333333)

    if (a - 41314.0 > 1.0) {
        return 1
    }

    if (a - 41314.6 > 0.1) {
        return 1
    }

    if (c - 41314.652154156 > 0.000000001) {
        return 1
    }

    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
