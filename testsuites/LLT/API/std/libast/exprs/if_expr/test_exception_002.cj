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
    let tokens1 = quote(else { foo() })
    try {
        let ifExpr1 = IfExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(while(true) { foo() })
    try {
        let ifExpr2 = IfExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr3 = IfExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr4 = IfExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr5 = IfExpr(quote(if(true){}else{}))
        ifExpr5.keywordI.dump()
        ifExpr5.keywordI = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr6 = IfExpr(quote(if(true){}else{}))
        ifExpr6.lParen.dump()
        ifExpr6.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr7 = IfExpr(quote(if(true){}else{}))
        ifExpr7.rParen.dump()
        ifExpr7.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr8 = IfExpr(quote(if(true){}else{}))
        let ifExpr88 = IfExpr()
        ifExpr8.condition = ifExpr88.condition
        ifExpr8.condition.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr9 = IfExpr(quote(if(true){}else{}))
        let ifExpr99 = IfExpr()
        ifExpr9.ifBlock = ifExpr99.ifBlock
        ifExpr9.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr10 = IfExpr(quote(if(true){}else{}))
        ifExpr10.keywordE.dump()
        ifExpr10.keywordE = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr11 = IfExpr(quote(if(true){}else{}))
        ifExpr11.elseExpr = ReturnExpr(quote(return 1))
        ifExpr11.elseExpr.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/*SCAN-IN
expected expression after '', found keyword 'else'
*/
// ASSERT: scan ASTException: Cannot construct the 'IfExpr' node
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: if, token_id: 98, token_literal_value: if
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be IF
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
/*SCAN-IN
value: "return"
*/
/*SCAN-IN
description: else, token_id: 99, token_literal_value: else
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be ELSE
*/
// ASSERT: scan cnt = 7