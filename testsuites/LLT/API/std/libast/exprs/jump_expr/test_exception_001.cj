// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote(return)
    try {
        let jumpExpr1 = JumpExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(break 1)
    try {
        let jumpExpr2 = JumpExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let jumpExpr3 = JumpExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let jumpExpr4 = JumpExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let jumpExpr5 = JumpExpr()
        jumpExpr5.keyword.dump()
        jumpExpr5.keyword = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let jumpExpr6 = JumpExpr(quote(break))
        jumpExpr6.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: Cannot construct the 'JumpExpr' node, TokenKind should be BREAK or CONTINUE
ASTException: Cannot construct the 'JumpExpr' node. (Empty Input)
description: illegal, token_id: 162, token_literal_value: , fileID: 0, line: 0, column: 0
ASTException: Illegal TokenKind, TokenKind should be BREAK or CONTINUE
JumpExpr {
  -keyword: Token {
    value: "break"
    kind: BREAK
    pos: 48: 40
  }
}
cnt = 3
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
