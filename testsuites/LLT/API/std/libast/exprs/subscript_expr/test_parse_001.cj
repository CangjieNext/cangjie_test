// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    // SubscriptExpr
    let input1 = quote(
        arr[0][1]
    )
    let input2 = quote(
        arr[0..][1]
    )
    let input3 = quote(
        arr[..4][1..4:2]
    )
    let input4 = quote(
        arr[..][1..=4:1]
    )

    let expr1 = parseExpr(input1)
    let expr2 = parseExpr(input2)
    let expr3 = parseExpr(input3)
    let expr4 = parseExpr(input4)

    let output1 = quote($expr1)
    let output2 = quote($expr2)
    let output3 = quote($expr3)
    let output4 = quote($expr4)

    let flag1 = compareTokens(input1, output1)
    if (!flag1) {
        return 1
    }
    let flag2 = compareTokens(input2, output2)
    if (!flag2) {
        return 2
    }
    let flag3 = compareTokens(input3, output3)
    if (!flag3) {
        return 3
    }
    let flag4 = compareTokens(input4, output4)
    if (!flag4) {
        return 4
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
