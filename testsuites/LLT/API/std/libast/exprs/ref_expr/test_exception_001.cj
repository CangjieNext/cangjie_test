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

/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: illegal, token_id: 162, token_literal_value:
*/
// ASSERT: scan 0
/*SCAN-IN
description: illegal, token_id: 162, token_literal_value:
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be LT
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be GT
*/
// ASSERT: scan cnt = 3