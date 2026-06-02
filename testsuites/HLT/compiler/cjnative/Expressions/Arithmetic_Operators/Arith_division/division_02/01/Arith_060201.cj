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
    let a: Int8 = 126 / 7
    let b: Int16 = 126 / 7
    let c: Int32 = 126 / 7
    let d: Int64 = 126 / 7

    if (a != 18) {
        return 1
    }

    if (b != 18) {
        return 1
    }

    if (c != 18) {
        return 1
    }

    if (d != 18) {
        return 1
    }

    let m: UInt8 = 240 / 15
    let n: UInt16 = 240 / 15
    let j: UInt32 = 240 / 15
    let k: UInt64 = 240 / 15

    if (m != 16) {
        return 1
    }

    if (n != 16) {
        return 1
    }

    if (j != 16) {
        return 1
    }

    if (k != 16) {
        return 1
    }

    return 0
}
