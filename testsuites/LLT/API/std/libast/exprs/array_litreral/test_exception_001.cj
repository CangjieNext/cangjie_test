/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args %noColor | compare %f

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

/*SCAN-IN
unclosed delimiter: '['
*/
// ASSERT: scan ASTException: Cannot construct the 'ArrayLiteral' node
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
// ASSERT: scan 0
/*SCAN-IN
description: l_square, token_id: 4, token_literal_value: [
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be LSQUARE
*/
/*SCAN-IN
description: r_square, token_id: 5, token_literal_value: ]
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be RSQUARE
*/
// ASSERT: scan cnt = 5