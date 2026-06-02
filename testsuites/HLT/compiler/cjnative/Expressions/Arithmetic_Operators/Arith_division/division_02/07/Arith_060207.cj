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
    let a: Float16 = 65503.2 / 255.32
    let b: Float32 = 65503.2 / 255.32
    let c: Float64 = 65503.2 / 255.32

    if (a - 256.553 > 0.001) {
        return 1
    }

    if (b - 256.553344 > 0.000001) {
        return 1
    }

    if (c - 256.5533448221839 > 0.0000000000001) {
        return 1
    }

    return 0
}
