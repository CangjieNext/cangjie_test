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
        return {}
    )
    try {
        let returnExpr1 = ReturnExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        match (a) {case _ => a}
    )
    try {
        let returnExpr2 = ReturnExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let returnExpr3 = ReturnExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens4 = quote()
    try {
        let returnExpr4 = ReturnExpr(tokens4)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens5 = quote(
        return 0
    )
    try {
        let returnExpr5 = ReturnExpr(tokens5)
        let returnExpr55 = ReturnExpr()
        returnExpr5.expr = returnExpr55.expr
        returnExpr5.expr.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens6 = quote(
        return 0
    )
    try {
        let returnExpr6 = ReturnExpr(tokens6)
        returnExpr6.keyword.dump()
        returnExpr6.keyword = Token()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

/*SCAN-IN
expected '=>' in lambda expression, found '}'
*/
// ASSERT: scan ASTException: Cannot construct the 'ReturnExpr' node
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
Current ReturnExpr has none expr
*/
/*SCAN-IN
description: return, token_id: 108, token_literal_value: return
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be RETURN
*/
// ASSERT: scan cnt = 5