// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        f{1, 1}
    )
    try {
        let callExpr1 = CallExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        f {i*i}
    )
    try {
        let callExpr2 = CallExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let callExpr3 = CallExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let callExpr4 = CallExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let callExpr5 = CallExpr(quote(f(1)))
        callExpr5.lParen.dump()
        callExpr5.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let callExpr6 = CallExpr(quote(f(1)))
        callExpr6.rParen.dump()
        callExpr6.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let callExpr7 = CallExpr(quote(f(1)))
        let callExpr77 = CallExpr(quote(f(2,3)))
        callExpr7.arguments = callExpr77.arguments
        println(callExpr7.arguments.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let callExpr8 = CallExpr(quote(f(1)))
        callExpr8.callFunc = OptionalExpr(quote(a?))
        println(callExpr8.toTokens())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: 
[31merror[0m: expected ';' or '<NL>', found ','
  [36m| [0m
  [36m| [0mf { 1, 1 }[0m
  [36m| [0m     [31m^ expected ';' or '<NL>' here[0m
  [36m| [0m

[31merror[0m: expected expression or declaration, found '}'
  [36m| [0m
  [36m| [0mf { 1, 1 }[0m
  [36m| [0m         [31m^ expected expression or declaration here[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'CallExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 43, column: 41
ASTException: Illegal TokenKind, TokenKind should be LPAREN
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 52, column: 43
ASTException: Illegal TokenKind, TokenKind should be RPAREN
2
a?(1)
cnt = 5
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
