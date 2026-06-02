// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    // case 1: input as TWO Tokens(LPAREN, RPAREN)
    let twoTokens = quote(()) // TWO Tokens
    if (twoTokens.size != 2) {
        return 1
    }
    let litConstExpr = (parseExpr(twoTokens) as LitConstExpr).getOrThrow()
    let literalToken = litConstExpr.literal // Return ONE Token
    literalToken.dump()
    if (literalToken.kind != TokenKind.UNIT_LITERAL) {
        return 2
    }

    // case 2: input as ONE Token(UNIT_LITERAL)
    let litConstExpr2 = (parseExpr(Tokens() + Token(UNIT_LITERAL)) as LitConstExpr).getOrThrow()
    if (litConstExpr2.literal.value != "()") {
        return 3
    }

    // case 3: ast2Tokens, we always return TWO Tokens
    let input = quote(())
    let litConstExpr3 = parseExpr(input)
    if (!compareTokens(input, quote($litConstExpr3))) {
        return 4
    }

    return 0
}

/* SCAN-IN
description: unit_literal, token_id: 152, token_literal_value: (), fileID: 1, line: 8, column: 27
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
