// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        do  while ( true ) { foo() }
    )
    try {
        let doWhileExpr1 = DoWhileExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        match (a) {case _ => a}
    )
    try {
        let doWhileExpr2 = DoWhileExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let doWhileExpr3 = DoWhileExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let doWhileExpr4 = DoWhileExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let doWhileExpr5 = DoWhileExpr(quote(do{}while(true)))
        doWhileExpr5.keywordD.dump()
        doWhileExpr5.keywordD = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let doWhileExpr6 = DoWhileExpr(quote(do{}while(true)))
        doWhileExpr6.keywordW.dump()
        doWhileExpr6.keywordW = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let doWhileExpr7 = DoWhileExpr(quote(do{}while(true)))
        doWhileExpr7.lParen.dump()
        doWhileExpr7.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let doWhileExpr8 = DoWhileExpr(quote(do{}while(true)))
        doWhileExpr8.rParen.dump()
        doWhileExpr8.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: 
[31merror[0m: trailing closure can only be used on function calls with function or variable names
  [36m| [0m
  [36m| [0mdo while(true) { foo() }[0m
  [36m| [0m[31m^^^^^^^^^^^^^^ [0m
  [36m| [0m

[31merror[0m: expected '{', found keyword 'while'
  [36m| [0m
  [36m| [0mdo while(true) { foo() }[0m
  [36m| [0m   [31m^^^^^ expected '{' here[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'DoWhileExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: do, token_id: 105, token_literal_value: do, fileID: 1, line: 43, column: 46
ASTException: Illegal TokenKind, TokenKind should be DO
description: while, token_id: 106, token_literal_value: while, fileID: 1, line: 52, column: 50
ASTException: Illegal TokenKind, TokenKind should be WHILE
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 61, column: 55
ASTException: Illegal TokenKind, TokenKind should be LPAREN
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 70, column: 60
ASTException: Illegal TokenKind, TokenKind should be RPAREN
cnt = 7
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
