// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote(else { foo() })
    try {
        let ifExpr1 = IfExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(while(true) { foo() })
    try {
        let ifExpr2 = IfExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr3 = IfExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr4 = IfExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr5 = IfExpr(quote(if(true){}else{}))
        ifExpr5.keywordI.dump()
        ifExpr5.keywordI = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr6 = IfExpr(quote(if(true){}else{}))
        ifExpr6.lParen.dump()
        ifExpr6.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr7 = IfExpr(quote(if(true){}else{}))
        ifExpr7.rParen.dump()
        ifExpr7.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr8 = IfExpr(quote(if(true){}else{}))
        let ifExpr88 = IfExpr()
        ifExpr8.condition = ifExpr88.condition
        ifExpr8.condition.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr9 = IfExpr(quote(if(true){}else{}))
        let ifExpr99 = IfExpr()
        ifExpr9.ifBlock = ifExpr99.ifBlock
        ifExpr9.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr10 = IfExpr(quote(if(true){}else{}))
        ifExpr10.keywordE.dump()
        ifExpr10.keywordE = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let ifExpr11 = IfExpr(quote(if(true){}else{}))
        ifExpr11.elseExpr = ReturnExpr(quote(return 1))
        ifExpr11.elseExpr.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: 
[31merror[0m: expected expression after '', found keyword 'else'
  [36m| [0m
  [36m| [0melse { foo() }[0m
  [36m| [0m[31m^^^^ expected expression here[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'IfExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: if, token_id: 98, token_literal_value: if, fileID: 1, line: 39, column: 36
ASTException: Illegal TokenKind, TokenKind should be IF
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 48, column: 38
ASTException: Illegal TokenKind, TokenKind should be LPAREN
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 57, column: 43
ASTException: Illegal TokenKind, TokenKind should be RPAREN
IfExpr {
  -keywordI: Token {
    value: "if"
    kind: IF
    pos: 76: 36
  }
  -condition: LitConstExpr {
    -literal: Token {
      value: "true"
      kind: BOOL_LITERAL
      pos: 76: 39
    }
  }
  -ifBlock: Block {
  }
  -keywordE: Token {
    value: "else"
    kind: ELSE
    pos: 76: 46
  }
  -elseExpr: Block {
  }
}
description: else, token_id: 99, token_literal_value: else, fileID: 1, line: 86, column: 47
ASTException: Illegal TokenKind, TokenKind should be ELSE
ReturnExpr {
  -keyword: Token {
    value: "return"
    kind: RETURN
    pos: 96: 46
  }
  -expr: LitConstExpr {
    -literal: Token {
      value: "1"
      kind: INTEGER_LITERAL
      pos: 96: 53
    }
  }
}
cnt = 7
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
