// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        0..10:3 // RangeExpr
    )
    let input2 = quote(
        let range1 = 0..=10:3 // RangeExpr
    )
    let input3 = quote(
        let range1 = 0..10 // RangeExpr
    )
    let decl1 = parseExpr(input1)
    let decl2 = parseDecl(input2)
    let decl3 = parseDecl(input3)
    let output1 = quote($decl1)
    let output2 = quote($decl2)
    let output3 = quote($decl3)
    let flag1 = compareTokens(input1, output1)
    let flag2 = compareTokens(input2, output2)
    let flag3 = compareTokens(input3, output3)
    if (!flag1 || !flag2 || !flag3) {
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
