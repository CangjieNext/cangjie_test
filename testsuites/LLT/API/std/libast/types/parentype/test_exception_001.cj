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
        (Int64, Int32)
    )
    try {
        ParenType(input)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        ParenType()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        ParenType(quote())
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let parenType = ParenType(quote((Int64)))
        parenType.lParen.dump()
        parenType.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let parenType = ParenType(quote((Int64)))
        parenType.rParen.dump()
        parenType.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let parenType = ParenType(quote((Int64)))
        let parenType1 = ParenType(quote((String)))
        parenType.dump()
        parenType.parenthesizedType = parenType1.parenthesizedType
        parenType.parenthesizedType.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

// ASSERT: scan Cannot construct the 'ParenType' node
// ASSERT: scan parsing type error
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan Illegal TokenKind, TokenKind should be LPAREN
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )
// ASSERT: scan Illegal TokenKind, TokenKind should be RPAREN
// ASSERT: scan ParenType {
// ASSERT: scan -parenthesizedType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "String"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan cnt = 4