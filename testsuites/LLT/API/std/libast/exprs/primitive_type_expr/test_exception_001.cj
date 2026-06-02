// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote(
        while (Some(v) <- a) {
           return v
        }
    )
    try {
        let primitiveTypeExpr1 = PrimitiveTypeExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        PrimitiveTypeExpr()
        PrimitiveTypeExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let primitiveTypeExpr2 = PrimitiveTypeExpr(quote(Int15))
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let primitiveTypeExpr3 = PrimitiveTypeExpr()
        primitiveTypeExpr3.keyword = Token(OR)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be a primitive type.
ASTException: Cannot construct the 'PrimitiveTypeExpr' node. (Empty Input)
ASTException: Illegal TokenKind, TokenKind should be a primitive type.
ASTException: Illegal TokenKind, TokenKind should be a primitive type.
cnt = 4
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
