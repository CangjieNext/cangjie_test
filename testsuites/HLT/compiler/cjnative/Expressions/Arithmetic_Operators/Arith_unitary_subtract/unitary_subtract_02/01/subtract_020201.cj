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
    let a: Int8 = -128
    let b: Int16 = -32768
    let c: Int32 = -2147483648
    let d: Int64 = -9223372036854775808

    if (a != -128) {
        return 1
    }

    if (b != -32768) {
        return 1
    }

    if (c != -2147483648) {
        return 1
    }

    if (d != -9223372036854775808) {
        return 1
    }

    return 0
}
