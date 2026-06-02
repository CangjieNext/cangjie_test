// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let literal = "true"
    let literalTokens = cangjieLex(literal)
    let litConstExpr = (parseExpr(literalTokens) as LitConstExpr).getOrThrow()
    let literalToken = litConstExpr.literal
    if (literalToken != Token(TokenKind.BOOL_LITERAL, "true").addPosition(0, 1, 1)) {
        return -1
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
