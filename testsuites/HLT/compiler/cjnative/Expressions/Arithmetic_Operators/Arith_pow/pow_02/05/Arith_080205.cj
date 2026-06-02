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
    let a = Int8(3 ** 0b100)
    let b = Int16(2 ** 0o16)
    let c = Int32(2 ** 0xe)
    let d: Int64 = 0b10 ** 0xe

    if (a != 81) {
        return 1
    }

    if (b != 16384) {
        return 1
    }

    if (c != 16384) {
        return 1
    }

    if (d != 16384) {
        return 1
    }

    let m = UInt8(3 ** 0b101)
    let n = UInt16(2 ** 0o17)
    let j = UInt32(2 ** 0xf)
    let k = 0b10 ** 0xf

    if (m != 243) {
        return 1
    }

    if (n != 32768) {
        return 1
    }

    if (j != 32768) {
        return 1
    }

    if (k != 32768) {
        return 1
    }

    return 0
}
