// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

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

/* SCAN-IN
Cannot construct the 'ParenType' node.
parsing type error.
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 34, column: 41
Illegal TokenKind, TokenKind should be LPAREN
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 43, column: 47
Illegal TokenKind, TokenKind should be RPAREN
ParenType {
  -parenthesizedType: PrimitiveType {
      -keyword: Token {
        value: "Int64"
        kind: INT64
        pos: 52: 42
      }
    }
}
RefType {
  -identifier: Token {
    value: "String"
    kind: IDENTIFIER
    pos: 53: 43
  }
}
cnt = 4
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
