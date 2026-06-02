// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan parsing expr error.
// ASSERT: scan ASTException: Cannot construct the 'UnaryExpr' node.
// ASSERT: scan description: and, token_id: 16, token_literal_value: &&, fileID: 1, line: 44, column: 25
// ASSERT: scan cnt = 2

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote(
        ==a
    )
    try {
        let unaryExpr1 = UnaryExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        a++
    )
    try {
        let unaryExpr2 = UnaryExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let unaryExpr3 = UnaryExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens4 = quote(
        !cnt
    )
    try {
        var unaryExpr4 = UnaryExpr(tokens4)
        unaryExpr4.op = Token(AND)
        unaryExpr4.op.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
