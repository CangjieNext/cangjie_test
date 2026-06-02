// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        throw Exception()
    )
    try {
        let throwExpr1 = ThrowExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        a++
    )
    try {
        let throwExpr2 = ThrowExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let throwExpr3 = ThrowExpr()
        var throwExpr33 = ThrowExpr(tokens1)
        throwExpr3.expr = throwExpr33.expr
        throwExpr3.expr.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens4 = quote(
        throw Exception()
    )
    try {
        var throwExpr4 = ThrowExpr(tokens4)
        throwExpr4.keyword.dump()
        throwExpr4.keyword = Token()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        ThrowExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

/* SCAN-IN
ASTException: Cannot construct the 'ThrowExpr' node.
CallExpr {
  -callFunc: RefExpr {
    -identifier: Token {
      value: "Exception"
      kind: IDENTIFIER
      pos: 9: 15
    }
  }
}
description: throw, token_id: 107, token_literal_value: throw, fileID: 1, line: 39, column: 9
ASTException: Illegal TokenKind, TokenKind should be THROW
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
cnt = 3
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
