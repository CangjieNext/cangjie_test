/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args %noColor | compare %f

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

/*SCAN-IN
unclosed delimiter: '('
*/
// ASSERT: scan ASTException: Cannot construct the 'ParenExpr' node
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: l_paren, token_id: 2, token_literal_value: (
*/
/*SCAN-IN
description: r_paren, token_id: 3, token_literal_value: )
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be LPAREN
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be RPAREN
*/
// ASSERT: scan cnt = 5