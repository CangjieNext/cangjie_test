// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        [1 23 a]
    )
    try {
        let arrayLiteral1 = ArrayLiteral(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        (1,2,3)
    )
    try {
        let arrayLiteral2 = ArrayLiteral(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let arrayLiteral3 = ArrayLiteral()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let arrayLiteral4 = ArrayLiteral(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let arrayLiteral5 = ArrayLiteral(quote([1,2,3]))
        let arrayLiteral55 = ArrayLiteral(quote([]))
        arrayLiteral5.elements = arrayLiteral55.elements
        println(arrayLiteral5.elements.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let arrayLiteral6 = ArrayLiteral(quote([1,2,3]))
        arrayLiteral6.lSquare.dump()
        arrayLiteral6.lSquare = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let arrayLiteral7 = ArrayLiteral(quote([1,2,3]))
        arrayLiteral7.rSquare.dump()
        arrayLiteral7.rSquare = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: 
[31merror[0m: unclosed delimiter: '['
  [36m| [0m
  [36m| [0m[1 23 a][0m
  [36m| [0m[36m~[0m [31m^ expected ']' here[0m
  [36m| [0m[36m|[0m
  [36m| [0m[36mto match this opening '['[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'ArrayLiteral' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
0
description: l_square, token_id: 4, token_literal_value: [, fileID: 1, line: 53, column: 48
ASTException: Illegal TokenKind, TokenKind should be LSQUARE
description: r_square, token_id: 5, token_literal_value: ], fileID: 1, line: 62, column: 54
ASTException: Illegal TokenKind, TokenKind should be RSQUARE
cnt = 5
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
