// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let code = "foo()"
    let callExprTokens = cangjieLex(code)
    let callExpr = (parseExpr(callExprTokens) as CallExpr).getOrThrow()
    let refExpr = (callExpr.callFunc as RefExpr).getOrThrow()
    let identifier = refExpr.identifier
    if (identifier != Token(TokenKind.IDENTIFIER, "foo").addPosition(0, 1, 1)) {
        return -1
    }

    let unary = "!1"
    let unaryExprTokens = cangjieLex(unary)
    let isExcept = (parseExpr(unaryExprTokens) is CallExpr)
    if (isExcept) {
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
