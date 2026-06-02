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
    let a: Int8 = 31 + 96
    let b: Int16 = 31 + 96
    let c: Int32 = 31 + 96
    let d: Int64 = 31 + 96

    if (a != 127) {
        return 1
    }

    if (b != 127) {
        return 1
    }

    if (c != 127) {
        return 1
    }

    if (d != 127) {
        return 1
    }

    let m: UInt8 = 63 + 192
    let n: UInt16 = 63 + 192
    let j: UInt32 = 63 + 192
    let k: UInt64 = 63 + 192

    if (m != 255) {
        return 1
    }

    if (n != 255) {
        return 1
    }

    if (j != 255) {
        return 1
    }

    if (k != 255) {
        return 1
    }

    return 0
}
