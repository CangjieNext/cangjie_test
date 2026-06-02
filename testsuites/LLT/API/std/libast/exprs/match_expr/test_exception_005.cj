// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

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

/* SCAN-IN
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: match, token_id: 113, token_literal_value: match, fileID: 1, line: 24, column: 42
ASTException: Illegal TokenKind, TokenKind should be MATCH
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 33, column: 47
ASTException: Illegal TokenKind, TokenKind should be LPAREN
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 42, column: 49
ASTException: Illegal TokenKind, TokenKind should be RPAREN
RefExpr {
  -identifier: Token {
    value: "b"
    kind: IDENTIFIER
    pos: 52: 49
  }
}
description: l_curl, token_id: 6, token_literal_value: {, fileID: 1, line: 61, column: 50
ASTException: Illegal TokenKind, TokenKind should be LCURL
description: r_curl, token_id: 7, token_literal_value: }, fileID: 1, line: 70, column: 65
ASTException: Illegal TokenKind, TokenKind should be RCURL
2
cnt = 6
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
