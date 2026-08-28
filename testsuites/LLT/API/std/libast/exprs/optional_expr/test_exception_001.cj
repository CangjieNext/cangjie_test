/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        b?.
    )
    try {
        let optionalExpr1 = OptionalExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        a
    )
    try {
        let optionalExpr2 = OptionalExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let optionalExpr3 = OptionalExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let optionalExpr4 = OptionalExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let optionalExpr5 = OptionalExpr(quote(a?))
        optionalExpr5.quest.dump()
        optionalExpr5.quest = Token(AND)
        optionalExpr5.quest.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

// ASSERT: scan ASTException: Cannot construct the 'OptionalExpr' node
// ASSERT: scan ASTException: Cannot construct the 'OptionalExpr' node
// ASSERT: scan ASTException: Cannot construct the 'OptionalExpr' node
// ASSERT: scan description: quest, token_id: 52, token_literal_value: ?
// ASSERT: scan ASTException: Illegal TokenKind, TokenKind should be QUEST
// ASSERT: scan cnt = 4