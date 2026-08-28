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
    let tokens1 = quote( 
        A[[
    )
    try {
        let subscriptExpr1 = SubscriptExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        b[]
    )
    try {
        let subscriptExpr2 = SubscriptExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let subscriptExpr3 = SubscriptExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let subscriptExpr4 = SubscriptExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let subscriptExpr5 = SubscriptExpr(quote(A[1..4:9]))
        subscriptExpr5.lSquare.dump()
        subscriptExpr5.lSquare = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let subscriptExpr6 = SubscriptExpr(quote(A[1..4:9]))
        subscriptExpr6.rSquare.dump()
        subscriptExpr6.rSquare = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let subscriptExpr7 = SubscriptExpr()
        let subscriptExpr77 = SubscriptExpr(quote(B[2..20:7][5]))
        subscriptExpr7.indexList = subscriptExpr77.indexList
        println(subscriptExpr7.indexList.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/*SCAN-IN
expected expression after '[', found '<EOF>'
*/
/*SCAN-IN
unclosed delimiter: '['
*/
/*SCAN-IN
expected expression after '[', found ']'
*/
/*SCAN-IN
expected expression after '', found '<EOF>'
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
// ASSERT: scan 1
// ASSERT: scan cnt = 5