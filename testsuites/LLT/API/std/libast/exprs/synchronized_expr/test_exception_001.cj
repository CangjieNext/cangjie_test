// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        synchronized {
            count += 1
        }
    )
    try {
        let synchronizedExpr1 = SynchronizedExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        spawn (ctx) {
                test.fetchAnd(125)
            }
    )
    try {
        let synchronizedExpr2 = SynchronizedExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let synchronizedExpr3 = SynchronizedExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let synchronizedExpr4 = SynchronizedExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let synchronizedExpr5 = SynchronizedExpr(quote(synchronized(mtx){1}))
        synchronizedExpr5.lParen.dump()
        synchronizedExpr5.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let synchronizedExpr6 = SynchronizedExpr(quote(synchronized(mtx){1}))
        synchronizedExpr6.rParen.dump()
        synchronizedExpr6.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let synchronizedExpr7 = SynchronizedExpr(quote(synchronized(mtx){1}))
        synchronizedExpr7.keyword.dump()
        synchronizedExpr7.keyword = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let synchronizedExpr8 = SynchronizedExpr(quote(synchronized(mtx){1}))
        let synchronizedExpr88 = SynchronizedExpr(quote(synchronized(m){2}))
        synchronizedExpr8.structuredMutex = synchronizedExpr88.structuredMutex
        synchronizedExpr8.block = synchronizedExpr88.block
        synchronizedExpr8.structuredMutex.dump()
        synchronizedExpr8.block.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: 
[31merror[0m: expected '(', found '{'
  [36m| [0m
  [36m| [0msynchronized {[0m
  [36m| [0m             [31m^ expected '(' here[0m
  [36m| [0m

[31merror[0m: expected '=>' in lambda expression, found 'count'
  [36m| [0m
  [36m| [0m    count += 1[0m
  [36m| [0m    [31m^^^^^ expected '=>' here[0m
  [36m| [0m

[31merror[0m: expected '{', found '<EOF>'
  [36m| [0m
  [36m| [0m}[0m
  [36m| [0m [31m^ expected '{' here[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'SynchronizedExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 47, column: 68
ASTException: Illegal TokenKind, TokenKind should be LPAREN
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 56, column: 72
ASTException: Illegal TokenKind, TokenKind should be RPAREN
description: synchronized, token_id: 134, token_literal_value: synchronized, fileID: 1, line: 65, column: 56
ASTException: Illegal TokenKind, TokenKind should be SYNCHRONIZED
RefExpr {
  -identifier: Token {
    value: "m"
    kind: IDENTIFIER
    pos: 75: 70
  }
}
Block {
  -nodes: 0, LitConstExpr {
    -literal: Token {
      value: "2"
      kind: INTEGER_LITERAL
      pos: 75: 73
    }
  }
}
cnt = 6
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
