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
    let a: Int8 = 10
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

    //a>=11 || b>=11 || c>=11 || d>=11 || e>=11 || f>=11 || g>=11 || h>=11 || a1>=11 || a2>11 || a3>=11{
    if (a >= 11 || b >= 11 || c >= 11 || d >= 11 || e >= 11 || f >= 11 || g >= 11 || h >= 11 || a3 >= 11) {
        return 1
    }

    if (a >= 9 && b >= 9 && c >= 9 && d >= 9 && e >= 9 && f >= 9 && g >= 9 && h >= 9 && a1 >= 9 && a2 >= 9 && a3 >= 9) {
        return 0
    }

    return 0
}
