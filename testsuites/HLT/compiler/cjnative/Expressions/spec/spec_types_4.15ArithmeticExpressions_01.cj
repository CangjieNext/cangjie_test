/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output -Woff unused

main() {
    let num1: Int64 = 8
    let num2 = -num1 // num2 = -8, with 'Int64' type
    let num3 = -(-num1) // num3 =  8, with 'Int64' type
    let q1 = 7 / 3 // integer division:   2
    let q2 = -7 / 3 // integer division:  -2
    let q3 = 7 / -3 // integer division:  -2
    let q4 = -7 / -3 // integer division:   2
    let r1 = 7 % 3 // integer remainder:  1
    let r2 = -7 % 3 // integer remainder: -1
    let r3 = 7 % -3 // integer remainder:  1
    let r4 = -7 % -3 // integer remainder: -1

    let f = 2 ** 3 // power：    8
    let a = 2 + 3 // add：      5
    let b = 3 - 1 // sub：      2
    let c = 3 * 4 // multi：   12
    let d = 6.6 / 1.1 // division： 6
    let e = 4 % 3 // mod：      1
    let g = 5 + 10 - 3 * 4 ** 2 / 3 % 5 // 5 + 10 - 3 * (4 ** 2) / 3 % 5

    let h: Int32 = 2147483647 // int_MAX
    let i: Int32 = 1
    let j: Int32 = h + i

    return 1
}
// ASSERT: scan chir_arithmetic_operator_overflow
