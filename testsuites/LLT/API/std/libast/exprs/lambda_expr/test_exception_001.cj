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
        { -> i * i }
    )
    try {
        let lambdaExpr1 = LambdaExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        {a + 1}
    )
    try {
        let lambdaExpr2 = LambdaExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let lambdaExpr3 = LambdaExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let lambdaExpr4 = LambdaExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let lambdaExpr5 = LambdaExpr(quote({a: Int64 => a}))
        lambdaExpr5.lBrace.dump()
        lambdaExpr5.lBrace = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let lambdaExpr6 = LambdaExpr(quote({a: Int64 => a}))
        lambdaExpr6.rBrace.dump()
        lambdaExpr6.rBrace = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let lambdaExpr7 = LambdaExpr(quote({a: Int64 => a}))
        lambdaExpr7.doubleArrow.dump()
        lambdaExpr7.doubleArrow = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let lambdaExpr8 = LambdaExpr(quote({a: Int64 => a}))
        let lambdaExpr88 = LambdaExpr(quote({a: Int64, b: float32 => a}))
        lambdaExpr8.funcParams = lambdaExpr88.funcParams
        print(lambdaExpr8.funcParams.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let lambdaExpr9 = LambdaExpr(quote({a: Int64 => a}))
        let lambdaExpr99 = LambdaExpr(quote({a: Int64, b: float32 => a+b}))
        lambdaExpr9.nodes = lambdaExpr99.nodes
        println(lambdaExpr9.nodes.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/*SCAN-IN
expected '=>' in lambda expression, found '->'
*/
/*SCAN-IN
expected '=>' in lambda expression, found 'a'
*/
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: l_curl, token_id: 6, token_literal_value: {
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be LCURL
*/
/*SCAN-IN
description: r_curl, token_id: 7, token_literal_value: }
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be RCURL
*/
/*SCAN-IN
description: double_arrow, token_id: 46, token_literal_value: =>
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be DOUBLE_ARROW
*/
// ASSERT: scan 21
// ASSERT: scan cnt = 6