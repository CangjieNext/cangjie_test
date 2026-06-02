// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

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

/* SCAN-IN
Cannot construct the 'FuncType' node.
parsing type error.
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 34, column: 39
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 34, column: 52
description: arrow, token_id: 44, token_literal_value: ->, fileID: 1, line: 34, column: 54
2
description: and, token_id: 16, token_literal_value: &&, fileID: 1, line: 46, column: 28
Illegal TokenKind, TokenKind should be COMMA
cnt = 3
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
