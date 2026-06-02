// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "(1024)"
    let parenExprTokens = cangjieLex(code)
    let parenExpr = (parseExpr(parenExprTokens) as ParenExpr).getOrThrow()
    let litConstExpr = (parenExpr.parenthesizedExpr as LitConstExpr).getOrThrow()
    let literalToken = litConstExpr.literal
    if (literalToken != Token(TokenKind.INTEGER_LITERAL, "1024").addPosition(0, 1, 2)) {
        return 1
    }

    let input2 = quote(
        (56 * foo())
    )
    let expr2 = (parseExpr(input2) as ParenExpr).getOrThrow()
    let expr3 = (expr2.parenthesizedExpr as BinaryExpr).getOrThrow()
    let le = (expr3.leftExpr as LitConstExpr).getOrThrow()
    if (le.literal.value != "56") {
        return 2
    }
    let re = (expr3.rightExpr as CallExpr).getOrThrow()
    if ((re.callFunc as RefExpr).getOrThrow().identifier.value != "foo") {
        return 3
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
