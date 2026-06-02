// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        while (Some(v) <- a) {
           return v
        }
    )
    try {
        let whileExpr1 = WhileExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
    	do { foo() } while ( true )
    )
    try {
        let whileExpr2 = WhileExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let whileExpr3 = WhileExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let whileExpr4 = WhileExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let whileExpr5 = WhileExpr(quote(while(true){}))
        whileExpr5.keyword.dump()
        whileExpr5.keyword = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let whileExpr6 = WhileExpr(quote(while(true){}))
        whileExpr6.lParen.dump()
        whileExpr6.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let whileExpr7 = WhileExpr(quote(while(true){}))
        whileExpr7.rParen.dump()
        whileExpr7.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let whileExpr8 = WhileExpr(quote(while(true){}))
        let whileExpr88 = WhileExpr(quote(while(false){}))
        whileExpr8.condition = whileExpr88.condition
        whileExpr8.condition.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let whileExpr9 = WhileExpr(quote(while(true){}))
        let whileExpr99 = WhileExpr(quote(while(true){1}))
        whileExpr9.block = whileExpr99.block
        whileExpr9.block.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: 
[31merror[0m: unclosed delimiter: '('
  [36m| [0m
  [36m| [0mwhile(Some(v) <- a) {[0m
  [36m| [0m     [36m~[0m       [31m^ expected ')' here[0m
  [36m| [0m     [36m|[0m
  [36m| [0m     [36mto match this opening '('[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'WhileExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: while, token_id: 106, token_literal_value: while, fileID: 1, line: 45, column: 42
ASTException: Illegal TokenKind, TokenKind should be WHILE
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 54, column: 47
ASTException: Illegal TokenKind, TokenKind should be LPAREN
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 63, column: 52
ASTException: Illegal TokenKind, TokenKind should be RPAREN
LitConstExpr {
  -literal: Token {
    value: "false"
    kind: BOOL_LITERAL
    pos: 73: 49
  }
}
Block {
  -nodes: 0, LitConstExpr {
    -literal: Token {
      value: "1"
      kind: INTEGER_LITERAL
      pos: 83: 55
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
