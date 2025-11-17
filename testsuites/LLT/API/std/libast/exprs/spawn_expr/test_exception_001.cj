// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public func visit(_: RefExpr) {
        println("traversed!")
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    var cnt = 0
    let tokens1 = quote(
    	fspan (ctx) { i * i }
    )
    try {
        let spawnExpr1 = SpawnExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
    	unsafe { i * i }
    )
    try {
        let spawnExpr2 = SpawnExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let spawnExpr3 = SpawnExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let spawnExpr4 = SpawnExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let spawnExpr5 = SpawnExpr(quote(spawn{A.a()}))
        spawnExpr5.lParen.dump()
        spawnExpr5.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let spawnExpr6 = SpawnExpr(quote(spawn{A.a()}))
        spawnExpr6.rParen.dump()
        spawnExpr6.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let spawnExpr7 = SpawnExpr(quote(spawn{A.a()}))
        spawnExpr7.keyword.dump()
        spawnExpr7.keyword = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let spawnExpr8 = SpawnExpr(quote(spawn{A.a()}))
        spawnExpr8.threadContext = RefExpr(quote(ctx))
        spawnExpr8.threadContext.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let spawnExpr9 = SpawnExpr(quote(spawn{A.a()}))
        spawnExpr9.lambdaExpr = LambdaExpr(quote({=>1}))
        spawnExpr9.lambdaExpr.dump()
        spawnExpr9.threadContext.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let spawnExpr10 = SpawnExpr(quote(spawn(ctx){A.a()}))
        spawnExpr10.traverse(myVisitor)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: Cannot construct the 'SpawnExpr' node.
ASTException: Cannot construct the 'SpawnExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: illegal, token_id: 156, token_literal_value: , fileID: 0, line: 0, column: 0
ASTException: Illegal TokenKind, TokenKind should be LPAREN
description: illegal, token_id: 156, token_literal_value: , fileID: 0, line: 0, column: 0
ASTException: Illegal TokenKind, TokenKind should be RPAREN
description: spawn, token_id: 133, token_literal_value: spawn, fileID: 1, line: 72, column: 42
ASTException: Illegal TokenKind, TokenKind should be SPAWN
RefExpr {
  -identifier: Token {
    value: "ctx"
    kind: IDENTIFIER
    pos: 82: 50
  }
}
LambdaExpr {
  -doubleArrow: Token {
    value: "=>"
    kind: DOUBLE_ARROW
    pos: 91: 51
  }
  -nodes: 0, LitConstExpr {
    -literal: Token {
      value: "1"
      kind: INTEGER_LITERAL
      pos: 91: 53
    }
  }
}
ASTException: Cannot get context from SpawnExpr
traversed!
traversed!
cnt = 7
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
