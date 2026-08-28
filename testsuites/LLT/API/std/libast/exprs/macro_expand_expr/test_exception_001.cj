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
        @when
    )
    try {
        let varrayExpr1 = MacroExpandExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        macro func M()
    )
    try {
        let varrayExpr2 = MacroExpandExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let macroExpandExpr3 = MacroExpandExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let macroExpandExpr4 = MacroExpandExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let macroExpandExpr5 = MacroExpandExpr(quote(@m(1)))
        macroExpandExpr5.lParen.dump()
        macroExpandExpr5.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let macroExpandExpr6 = MacroExpandExpr(quote(@m(1)))
        macroExpandExpr6.rParen.dump()
        macroExpandExpr6.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let macroExpandExpr7 = MacroExpandExpr(quote(@M[attr](input)))
        println(macroExpandExpr7.toTokens().size)
        macroExpandExpr7.dump()
        let macroExpandExpr77 = MacroExpandExpr(quote(@A.m[b,c](d)))
        macroExpandExpr7.macroAttrs = macroExpandExpr77.macroAttrs
        println(macroExpandExpr7.macroAttrs.size)
        macroExpandExpr7.macroInputs = macroExpandExpr77.macroInputs
        println(macroExpandExpr7.macroInputs.size)
        macroExpandExpr7.identifier = macroExpandExpr77.identifier
        macroExpandExpr7.identifier.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let macroExpandExpr8 = MacroExpandExpr(quote(@m[a](1)))
        macroExpandExpr8.lSquare.dump()
        macroExpandExpr8.lSquare = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let macroExpandExpr9 = MacroExpandExpr(quote(@m[a](1)))
        macroExpandExpr9.rSquare.dump()
        macroExpandExpr9.rSquare = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let macroExpandExpr10 = MacroExpandExpr(quote(@m(1)))
        macroExpandExpr10.at = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let macroExpandExpr11 = MacroExpandExpr()
        println(MacroExpandExpr().toTokens().size)
        println(MacroExpandExpr(quote(@A.B.m())).toTokens().size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/*SCAN-IN
expected declaration, found '<EOF>'
*/
/*SCAN-IN
unexpected parameters for macro invocation here
*/
/*SCAN-IN
expected expression after '', found keyword 'macro'
*/
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: l_paren, token_id: 2, token_literal_value: (
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be LPAREN
*/
/*SCAN-IN
description: r_paren, token_id: 3, token_literal_value: )
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be RPAREN
*/
// ASSERT: scan 8
// ASSERT: scan 3
// ASSERT: scan 1
/*SCAN-IN
description: identifier, token_id: 137, token_literal_value: A.m
*/
/*SCAN-IN
description: l_square, token_id: 4, token_literal_value: [
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be LSQUARE
*/
/*SCAN-IN
description: r_square, token_id: 5, token_literal_value: ]
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be RSQUARE
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be AT
*/
// ASSERT: scan 8
// ASSERT: scan cnt = 8