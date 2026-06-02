// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        (1 23 a)
    )
    try {
        let parenExpr1 = ParenExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        (1,2,3)
    )
    try {
        let parenExpr2 = ParenExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let parenExpr3 = ParenExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens4 = quote()
    try {
        let parenExpr4 = ParenExpr(tokens4)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens5 = quote(
        (1 + 2)
    )
    try {
        let parenExpr5 = ParenExpr(tokens5)
        let parenExpr55 = ParenExpr()
        parenExpr5.parenthesizedExpr = parenExpr55.parenthesizedExpr
        parenExpr5.lParen.dump()
        parenExpr5.parenthesizedExpr.dump()
        parenExpr5.rParen.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens6 = quote(
        (1 + 2)
    )
    try {
        let parenExpr6 = ParenExpr(tokens6)
        parenExpr6.lParen = Token()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens7 = quote(
        (1 + 2)
    )
    try {
        let parenExpr7 = ParenExpr(tokens7)
        parenExpr7.rParen = Token()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

/* SCAN-IN
ASTException: 
[31merror[0m: unclosed delimiter: '('
  [36m| [0m
  [36m| [0m(1 23 a)[0m
  [36m| [0m[36m~[0m [31m^ expected ')' here[0m
  [36m| [0m[36m|[0m
  [36m| [0m[36mto match this opening '('[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'ParenExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 44, column: 9
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 44, column: 15
ASTException: Illegal TokenKind, TokenKind should be LPAREN
ASTException: Illegal TokenKind, TokenKind should be RPAREN
cnt = 5
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
