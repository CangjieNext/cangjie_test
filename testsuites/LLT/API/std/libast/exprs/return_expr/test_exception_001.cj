// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

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

/* SCAN-IN
ASTException: 
[31merror[0m: expected '=>' in lambda expression, found '}'
  [36m| [0m
  [36m| [0mreturn { }[0m
  [36m| [0m         [31m^ expected '=>' here[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'ReturnExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
ASTException: Current ReturnExpr has none expr
description: return, token_id: 108, token_literal_value: return, fileID: 1, line: 57, column: 9
ASTException: Illegal TokenKind, TokenKind should be RETURN
cnt = 5
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
