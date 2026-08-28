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
        let forInExpr1 = ForInExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(while(true) { foo() })
    try {
        let forInExpr2 = ForInExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr3 = ForInExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr4 = ForInExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr5 = ForInExpr(quote(for (a in A){}))
        forInExpr5.keywordI.dump()
        forInExpr5.keywordI = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr6 = ForInExpr(quote(for (a in A){}))
        forInExpr6.lParen.dump()
        forInExpr6.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr7 = ForInExpr(quote(for (a in A){}))
        forInExpr7.rParen.dump()
        forInExpr7.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr8 = ForInExpr(quote(for (a in A){}))
        let forInExpr88 = ForInExpr(quote(for (b in B){0}))
        forInExpr8.pattern = forInExpr88.pattern
        forInExpr8.pattern.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr9 = ForInExpr(quote(for (a in A where a != 0){}))
        let forInExpr99 = ForInExpr(quote(for (b in B){0}))
        forInExpr9.block = forInExpr99.block
        forInExpr9.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr10 = ForInExpr(quote(for (a in A){}))
        forInExpr10.keywordW.dump()
        forInExpr10.keywordW = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr11 = ForInExpr(quote(for (a in A){}))
        forInExpr11.patternGuard = UnaryExpr(quote(!a))
        forInExpr11.patternGuard.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr12 = ForInExpr(quote(for (a in A){}))
        let forInExpr122 = ForInExpr(quote(for (b in B){0}))
        forInExpr12.expr = forInExpr122.expr
        forInExpr12.expr.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr13 = ForInExpr(quote(for (a in A){}))
        forInExpr13.keywordF.dump()
        forInExpr13.keywordF = Token(AND)
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
// ASSERT: scan ASTException: Cannot construct the 'ForInExpr' node
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: in, token_id: 111, token_literal_value: in
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be IN
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
value: "b"
*/
/*SCAN-IN
description: illegal, token_id: 162, token_literal_value:
*/
/*SCAN-IN
description: for, token_id: 104, token_literal_value: for
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be FOR
*/
// ASSERT: scan cnt = 7