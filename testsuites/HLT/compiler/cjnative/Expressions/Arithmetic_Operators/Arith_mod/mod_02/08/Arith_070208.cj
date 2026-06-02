/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    let a: Float16 = Float16(0x7bff) % Float16(0x5bfa)
    let b: Float32 = Float32(0x477fdf33) % Float32(0x437f51eb)
    let c: Float64 = Float64(0x40effbe666666666) % Float64(0x406fea3d66666666)

    if (a - 8192.0 > 0.01) {
        return 1
    }

    if (b - 67144960.0 > 0.01) {
        return 1
    }

    if (c - 36048214566109184.0 > 0.01) {
        return 1
    }

    return 0
}
// ASSERT: scan sema_invalid_binary_expr
