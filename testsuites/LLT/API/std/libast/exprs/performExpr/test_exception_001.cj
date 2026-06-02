/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %set_stdx_path %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        perform Eff()
    )
    try {
        let performExpr1 = PerformExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        a++
    )
    try {
        let performExpr2 = PerformExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let performExpr3 = PerformExpr()
        var performExpr33 = PerformExpr(tokens1)
        performExpr3.expr = performExpr33.expr
        performExpr3.expr.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens4 = quote(
        perform Eff()
    )
    try {
        var performExpr4 = PerformExpr(tokens4)
        performExpr4.keyword.dump()
        performExpr4.keyword = Token()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        PerformExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

/* SCAN-IN
ASTException: Cannot construct the 'PerformExpr' node.
CallExpr {
  -callFunc: RefExpr {
    -identifier: Token {
      value: "Eff"
      kind: IDENTIFIER
      pos: 17: 17
    }
  }
}
description: perform, token_id: 158, token_literal_value: perform, fileID: 1, line: 47, column: 9
ASTException: Illegal TokenKind, TokenKind should be PERFORM
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
cnt = 3
 */
