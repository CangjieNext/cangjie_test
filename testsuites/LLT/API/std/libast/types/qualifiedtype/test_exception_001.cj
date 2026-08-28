/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0

    let input = quote(
        A
    )
    try {
        QualifiedType(input)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        QualifiedType()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        QualifiedType(quote())
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let qualifiedType = QualifiedType(quote(A.b<Int64>))
        qualifiedType.lAngle.dump()
        qualifiedType.rAngle.dump()
        qualifiedType.dot.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let qualifiedType = QualifiedType(quote(B.c<Int64, Float64>))
        qualifiedType.commas = Tokens().append(Token(AND))
        qualifiedType.commas.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

// ASSERT: scan Cannot construct the 'QualifiedType' node
// ASSERT: scan parsing type error
// ASSERT: scan description: less, token_id: 53, token_literal_value: <
// ASSERT: scan description: greater, token_id: 54, token_literal_value: >
// ASSERT: scan description: dot, token_id: 0, token_literal_value:
// ASSERT: scan Illegal TokenKind, TokenKind should be COMMA
// ASSERT: scan cnt = 3