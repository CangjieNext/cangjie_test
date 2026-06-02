// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        a==
    )
    try {
        let incOrDecExpr1 = IncOrDecExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        !a
    )
    try {
        let incOrDecExpr2 = IncOrDecExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let incOrDecExpr3 = IncOrDecExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let incOrDecExpr4 = IncOrDecExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let incOrDecExpr5 = IncOrDecExpr()
        incOrDecExpr5.op = Token(AND)
        incOrDecExpr5.op.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: 
[31merror[0m: expected expression after '==', found '<EOF>'
  [36m| [0m
  [36m| [0ma ==[0m
  [36m| [0m    [31m^ expected expression here[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'IncOrDecExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: and, token_id: 16, token_literal_value: &&, fileID: 1, line: 44, column: 28
cnt = 3
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
