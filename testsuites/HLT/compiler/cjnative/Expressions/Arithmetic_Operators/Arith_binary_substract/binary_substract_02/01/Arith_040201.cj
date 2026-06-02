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
    let a: Int8 = 31 - 127
    let b: Int16 = 31 - 127
    let c: Int32 = 31 - 127
    let d: Int64 = 31 - 127

    if (a != -96) {
        return 1
    }

    if (b != -96) {
        return 1
    }

    if (c != -96) {
        return 1
    }

    if (d != -96) {
        return 1
    }

    let m: UInt8 = 255 - 128
    let n: UInt16 = 255 - 128
    let j: UInt32 = 255 - 128
    let k: UInt64 = 255 - 128

    if (m != 127) {
        return 1
    }

    if (n != 127) {
        return 1
    }

    if (j != 127) {
        return 1
    }

    if (k != 127) {
        return 1
    }

    return 0
}
