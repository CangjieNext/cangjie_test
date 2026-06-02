// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

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

/* SCAN-IN
ASTException: 
[31merror[0m: expected '(' after 'quote', found line break
  [36m| [0m
  [36m| [0mquote[0m
  [36m| [0m[31m^^^^^ unexpected line break here[0m
  [36m| [0m

parsing expr error.
ASTException: 
[31merror[0m: unclosed delimiter: '('
  [36m| [0m
  [36m| [0mquote([0m
  [36m| [0m     [36m~[0m [31m^ expected ')' here[0m
  [36m| [0m     [36m|[0m
  [36m| [0m     [36mto match this opening '('[0m
  [36m| [0m

parsing expr error.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 45, column: 47
ASTException: Illegal TokenKind, TokenKind should be LPAREN
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 54, column: 51
ASTException: Illegal TokenKind, TokenKind should be RPAREN
3
quote($(a)  < VArray <, $>> $(! a))
QuoteExpr {
  -keyword: Token {
    value: "quote"
    kind: QUOTE
  }
  -exprs: 0, RefExpr {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 67: 59
    }
  }
  -exprs: 1, RefExpr {
    -identifier: Token {
      value: ""
      kind: DOLLAR_IDENTIFIER
      pos: 65: 30
    }
    typeArguments: 0, VArrayType {
      -VARRAY: Token {
        value: "VArray"
        kind: VARRAY
      }
      -elementTy:       -dollar: Token {
        value: "$"
        kind: DOLLAR
      }
    }
  }
  -exprs: 2, UnaryExpr {
    -op: Token {
      value: "!"
      kind: NOT
      pos: 67: 89
    }
    -expr: RefExpr {
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 67: 90
      }
    }
  }
}
description: quote, token_id: 89, token_literal_value: quote, fileID: 1, line: 77, column: 42
ASTException: Illegal TokenKind, TokenKind should be QUOTE
cnt = 6
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
