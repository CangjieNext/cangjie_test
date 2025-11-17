// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0

    try {
        let refExpr1 = RefExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote()
    try {
        let refExpr2 = RefExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens3 = quote(
        a
    )
    try {
        let refExpr3 = RefExpr(tokens3)
        let refExpr33 = RefExpr()
        refExpr3.typeArguments = refExpr33.typeArguments
        refExpr3.lAngle.dump()
        println(refExpr3.typeArguments.size)
        refExpr3.rAngle.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens4 = quote(
        a
    )
    try {
        let refExpr4 = RefExpr(tokens4)
        refExpr4.lAngle = Token()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens5 = quote(
        a
    )
    try {
        let refExpr5 = RefExpr(tokens5)
        refExpr5.rAngle = Token()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

/* SCAN-IN
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: illegal, token_id: 156, token_literal_value: , fileID: 0, line: 0, column: 0
0
description: illegal, token_id: 156, token_literal_value: , fileID: 0, line: 0, column: 0
ASTException: Illegal TokenKind, TokenKind should be LT
ASTException: Illegal TokenKind, TokenKind should be GT
cnt = 3
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
