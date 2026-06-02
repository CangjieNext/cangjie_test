// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

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

/* SCAN-IN
ASTException: Cannot construct the 'JumpExpr' node, TokenKind should be BREAK or CONTINUE
description: break, token_id: 110, token_literal_value: break, fileID: 1, line: 16, column: 25
ASTException: Illegal TokenKind, TokenKind should be BREAK or CONTINUE
cnt = 2
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
