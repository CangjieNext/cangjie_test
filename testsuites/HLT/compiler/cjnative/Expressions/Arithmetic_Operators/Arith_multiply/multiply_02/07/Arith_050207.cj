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
    let a: Float16 = 63.9 * 255.9
    let b: Float32 = 63.9 * 255.9
    let c: Float64 = 63.9 * 255.9

    if (a != 16352.01) {
        return 1
    }

    if (b != 16352.01) {
        return 1
    }

    if (c != 16352.01) {
        return 1
    }

    return 0
}
