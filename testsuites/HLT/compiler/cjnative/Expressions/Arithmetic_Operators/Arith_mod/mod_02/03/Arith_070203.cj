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
    let a: Int8 = 0o176 % 0o21
    let b: Int16 = 0o176 % 0o21
    let c: Int32 = 0o176 % 0o21
    let d: Int64 = 0o176 % 0o21

    if (a != 7) {
        return 1
    }

    if (b != 7) {
        return 1
    }

    if (c != 7) {
        return 1
    }

    if (d != 7) {
        return 1
    }

    let m: UInt8 = 0o300 % 0o17
    let n: UInt16 = 0o300 % 0o17
    let j: UInt32 = 0o300 % 0o17
    let k: UInt64 = 0o300 % 0o17

    if (m != 12) {
        return 1
    }

    if (n != 12) {
        return 1
    }

    if (j != 12) {
        return 1
    }

    if (k != 12) {
        return 1
    }

    return 0
}
