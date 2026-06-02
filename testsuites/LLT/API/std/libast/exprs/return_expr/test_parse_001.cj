// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "return 0"
    let returnExprTokens = cangjieLex(code)
    let returnExpr = (parseExpr(returnExprTokens) as ReturnExpr).getOrThrow()
    let litConstExpr = (returnExpr.expr as LitConstExpr).getOrThrow()
    let literalToken = litConstExpr.literal
    if (literalToken != Token(TokenKind.INTEGER_LITERAL, "0").addPosition(0, 1, 8)) {
        return -1
    }

    let input2 = quote(return ())
    let expr2 = (parseExpr(input2) as ReturnExpr).getOrThrow()
    let expr3 = expr2.expr
    if (!(expr3 is LitConstExpr)) {
        return 1
    }

    let unary = "!1"
    let unaryExprTokens = cangjieLex(unary)
    let unaryIsReturn = (parseExpr(unaryExprTokens) is ReturnExpr)
    if (unaryIsReturn) {
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
