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
        a != b
    )
    try {
        let assignExpr1 = AssignExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        a++
    )
    try {
        let assignExpr2 = AssignExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let assignExpr3 = AssignExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let assignExpr4 = AssignExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let assignExpr5 = AssignExpr(quote(a=b))
        assignExpr5.assign.dump()
        assignExpr5.rightExpr = AssignExpr(quote(b=c)).rightExpr
        assignExpr5.rightExpr.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

// ASSERT: scan ASTException: Cannot construct the 'AssignExpr' node
// ASSERT: scan ASTException: Cannot construct the 'AssignExpr' node
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: assign, token_id: 30, token_literal_value: =
*/
/*SCAN-IN
value: "c"
*/
// ASSERT: scan cnt = 3