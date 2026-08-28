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
        FuncType(input)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        FuncType()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        FuncType(quote())
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let funcType = FuncType(quote((Int64, Int32) -> String))
        funcType.lParen.dump()
        funcType.rParen.dump()
        funcType.arrow.dump()
        println(funcType.types.size)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let funcType = FuncType(quote((Int64, Int32) -> String))
        funcType.keyword = Token(AND)
        funcType.keyword.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let funcType = FuncType(quote((Int64, Int32) -> String))
        funcType.commas = Tokens().append(Token(AND))
        funcType.commas.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

// ASSERT: scan Cannot construct the 'FuncType' node
// ASSERT: scan parsing type error
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )
// ASSERT: scan description: arrow, token_id: 44, token_literal_value: ->
// ASSERT: scan 2
// ASSERT: scan description: and, token_id: 16, token_literal_value: &&
// ASSERT: scan Illegal TokenKind, TokenKind should be COMMA
// ASSERT: scan cnt = 3