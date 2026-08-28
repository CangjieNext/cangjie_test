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

    try {
        let matchExpr1 = MatchExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let matchExpr2 = MatchExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let matchExpr3 = MatchExpr(quote(match(a){case _ => true}))
        matchExpr3.keyword.dump()
        matchExpr3.keyword = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let matchExpr4 = MatchExpr(quote(match(a){case _ => true}))
        matchExpr4.lParen.dump()
        matchExpr4.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let matchExpr5 = MatchExpr(quote(match(a){case _ => true}))
        matchExpr5.rParen.dump()
        matchExpr5.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let matchExpr6 = MatchExpr(quote(match(a){case _ => true}))
        let matchExpr66 = MatchExpr(quote(match(b){case _ => false}))
        matchExpr6.selector = matchExpr66.selector
        matchExpr6.selector.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let matchExpr7 = MatchExpr(quote(match(a){case _ => true}))
        matchExpr7.lBrace.dump()
        matchExpr7.lBrace = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let matchExpr8 = MatchExpr(quote(match(a){case _ => true}))
        matchExpr8.rBrace.dump()
        matchExpr8.rBrace = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let matchExpr9 = MatchExpr(quote(match(a){case _ => true}))
        let matchExpr99 = MatchExpr(quote(match(a){case b => true; case c => false}))
        matchExpr9.matchCases = matchExpr99.matchCases
        println(matchExpr9.matchCases.size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/*SCAN-IN
expected expression after '', found '<EOF>'
*/
/*SCAN-IN
description: match, token_id: 113, token_literal_value: match
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be MATCH
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
/*SCAN-IN
value: "b"
*/
/*SCAN-IN
description: l_curl, token_id: 6, token_literal_value: {
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be LCURL
*/
/*SCAN-IN
description: r_curl, token_id: 7, token_literal_value: }
*/
/*SCAN-IN
ASTException: Illegal TokenKind, TokenKind should be RCURL
*/
// ASSERT: scan 2
// ASSERT: scan cnt = 6