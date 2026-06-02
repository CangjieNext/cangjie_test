// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "(1024)"
    let parenExprTokens = cangjieLex(code)
    let parenExpr = parseExpr(parenExprTokens) is ParenExpr
    if (!parenExpr) {
        return 1
    }
    let code1 = "1024"
    let parenExprToks = cangjieLex(code1)
    let isParenExpr = parseExpr(parenExprToks) is ParenExpr
    if (isParenExpr) {
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
