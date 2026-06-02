// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        foo(1,2){a: Int32, b: Int32 => a + b}
    )
    let input2 = quote(
        a.b.foo(1,2){a: Int32, b: Int32 => a + b}
    )
    let expr1 = parseExpr(input1)
    let expr2 = parseExpr(input2)
    let output1 = quote($expr1)
    let output2 = quote($expr2)
    let flag1 = compareTokens(input1, output1) // libast offers compareTokens
    let flag2 = compareTokens(input2, output2)
    if (!(flag1 && flag2)) {
        return 1
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
