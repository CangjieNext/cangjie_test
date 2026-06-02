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
    let a = 10
    let a1: Int8 = 0b1010
    let a2: Int8 = 0o12
    let a3: Int8 = 0xa
    let b: Int16 = 10
    let c: Int32 = 10
    let d: Int64 = 10
    let e: UInt8 = 10
    let f: UInt16 = 10
    let g: UInt32 = 10
    let h: UInt64 = 10
    let i = 9

    if (a >= 8 && b >= 8 && c >= 8 && d >= 8 && e >= 8 && f >= 8 && g >= 8 && h >= 8 && a1 >= 8 && a2 >= 8 && a3 >= 8 &&
        a >= i) {
        return 0
    }

    return 1
}
