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
    let a: Int8 = 31 + 0b01100000
    let b: Int16 = 31 + 0o140
    let c: Int32 = 31 + 0x60
    let d: Int64 = 0b00011111 + 0x60

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

    let m: UInt8 = 63 + 0b11000000
    let n: UInt16 = 63 + 0o300
    let j: UInt32 = 63 + 0xc0
    let k: UInt64 = 0b00111111 + 0xc0

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
