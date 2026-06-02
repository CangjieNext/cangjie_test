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
    let a: Int8 = 126 / 0b111
    let b: Int16 = 126 / 0o7
    let c: Int32 = 126 / 0x7
    let d: Int64 = 0b1111110 / 0x7

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

    let m: UInt8 = 240 / 0b1111
    let n: UInt16 = 240 / 0o17
    let j: UInt32 = 240 / 0x8
    let k: UInt64 = 0b11110000 / 0x8

    if (m != 16) {
        return 1
    }

    if (n != 16) {
        return 1
    }

    if (j != 30) {
        return 1
    }

    if (k != 30) {
        return 1
    }

    return 0
}
