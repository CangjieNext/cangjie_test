/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = Tokens() + Token(IDENTIFIER, "break")
    try {
        let jumpExpr1 = JumpExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(break)
    tokens2.dump()
    try {
        let jumpExpr2 = JumpExpr(tokens2)
        jumpExpr2.keyword = Token(IDENTIFIER, "continue")
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${2}")
    return 0
}

// ASSERT: scan ASTException: Cannot construct the 'JumpExpr' node, TokenKind should be BREAK or CONTINUE
// ASSERT: scan description: break, token_id: 110, token_literal_value: break
// ASSERT: scan ASTException: Illegal TokenKind, TokenKind should be BREAK or CONTINUE
// ASSERT: scan cnt = 2