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
internal import std.collection.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        quote
    )
    try {
        let quoteExpr1 = QuoteExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        quote\(
    )
    try {
        let quoteExpr2 = QuoteExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let quoteExpr3 = QuoteExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let quoteExpr4 = QuoteExpr(quote())
        println(quoteExpr4.toTokens().size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let quoteExpr5 = QuoteExpr(quote(quote(a+1)))
        quoteExpr5.lParen.dump()
        quoteExpr5.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let quoteExpr6 = QuoteExpr(quote(quote(a+1)))
        quoteExpr6.rParen.dump()
        quoteExpr6.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let quoteExpr7 = QuoteExpr()
        let refExpr = RefExpr()
        refExpr.identifier = Token(DOLLAR_IDENTIFIER)
        refExpr.typeArguments = ArrayList<TypeNode>.of(VArrayType())
        quoteExpr7.exprs = ArrayList<Expr>([RefExpr(quote(a)), refExpr, UnaryExpr(quote(!a))])
        println(quoteExpr7.exprs.size)
        println(quoteExpr7.toTokens())
        quoteExpr7.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let quoteExpr8 = QuoteExpr(quote(quote(a+1)))
        quoteExpr8.keyword.dump()
        quoteExpr8.keyword = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/*SCAN-IN
expected '(' after 'quote', found line break
*/
/*SCAN-IN
unclosed delimiter: '('
*/
/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: l_paren, token_id: 2, token_literal_value: (
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be LPAREN
*/
/*SCAN-IN
description: r_paren, token_id: 3, token_literal_value: )
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be RPAREN
*/
// ASSERT: scan 3
// ASSERT: scan quote($(a)  < VArray <, $>> $(! a))
/*SCAN-IN
description: quote, token_id: 89, token_literal_value: quote
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be QUOTE
*/
// ASSERT: scan cnt = 6