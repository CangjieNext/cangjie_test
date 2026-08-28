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
        VArrayType(input)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        VArrayType()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        VArrayType(quote())
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let vArrayType = VArrayType(quote(VArray<Int32, \$10>))
        vArrayType.lAngle.dump()
        vArrayType.lAngle = Token(AND)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let vArrayType = VArrayType(quote(VArray<Int32, \$10>))
        vArrayType.rAngle.dump()
        vArrayType.rAngle = Token(AND)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let vArrayType = VArrayType(quote(VArray<Int32, \$10>))
        let vArrayType1 = VArrayType(quote(VArray<Float64, \$5>))
        vArrayType.elementTy = vArrayType1.elementTy
        vArrayType.elementTy.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let vArrayType = VArrayType(quote(VArray<Int32, \$10>))
        vArrayType.size = Token(AND)
        vArrayType.size.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let vArrayType = VArrayType(quote(VArray<Int32, \$10>))
        vArrayType.dollar.dump()
        vArrayType.dollar = Token(AND)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

// ASSERT: scan Cannot construct the 'VArrayType' node
// ASSERT: scan parsing type error
// ASSERT: scan description: less, token_id: 53, token_literal_value: <
// ASSERT: scan Illegal TokenKind, TokenKind should be LT
// ASSERT: scan description: greater, token_id: 54, token_literal_value: >
// ASSERT: scan Illegal TokenKind, TokenKind should be GT
// ASSERT: scan PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Float64"
// ASSERT: scan kind: FLOAT64
// ASSERT: scan description: and, token_id: 16, token_literal_value: &&
// ASSERT: scan description: dollar, token_id: 90, token_literal_value: $
// ASSERT: scan Illegal TokenKind, TokenKind should be DOLLAR
// ASSERT: scan cnt = 5