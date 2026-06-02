// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    try {
        let isExpr1 = IsExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote()
    try {
        let isExpr2 = IsExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens3 = quote(
        (1 == 0) is Bool
    )
    try {
        let isExpr3 = IsExpr(tokens3)
        isExpr3.keyword.dump()
        let isExpr33 = IsExpr(tokens3.append(tokens2))
        isExpr3.shiftType = isExpr33.shiftType
        isExpr3.keyword = Token()
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
description: is, token_id: 57, token_literal_value: is, fileID: 1, line: 24, column: 18
ASTException: Illegal TokenKind, TokenKind should be IS
cnt = 2
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
