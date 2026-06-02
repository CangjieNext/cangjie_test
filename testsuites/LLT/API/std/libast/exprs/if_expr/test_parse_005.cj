// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        if (a > 1) {a++}
    )
    let realExpr = parseExpr(input) is IfExpr
    if (!realExpr) {
        return 1
    }
    let inputOther = quote(
        a++
    )
    let failExpr = parseExpr(inputOther) is IfExpr
    if (failExpr) {
        return 2
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
