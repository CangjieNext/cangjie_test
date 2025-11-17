// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote(else { foo() })
    try {
        let forInExpr1 = ForInExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(while(true) { foo() })
    try {
        let forInExpr2 = ForInExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr3 = ForInExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr4 = ForInExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr5 = ForInExpr(quote(for (a in A){}))
        forInExpr5.keywordI.dump()
        forInExpr5.keywordI = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr6 = ForInExpr(quote(for (a in A){}))
        forInExpr6.lParen.dump()
        forInExpr6.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr7 = ForInExpr(quote(for (a in A){}))
        forInExpr7.rParen.dump()
        forInExpr7.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr8 = ForInExpr(quote(for (a in A){}))
        let forInExpr88 = ForInExpr(quote(for (b in B){0}))
        forInExpr8.pattern = forInExpr88.pattern
        forInExpr8.pattern.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr9 = ForInExpr(quote(for (a in A where a != 0){}))
        let forInExpr99 = ForInExpr(quote(for (b in B){0}))
        forInExpr9.block = forInExpr99.block
        forInExpr9.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr10 = ForInExpr(quote(for (a in A){}))
        forInExpr10.keywordW.dump()
        forInExpr10.keywordW = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr11 = ForInExpr(quote(for (a in A){}))
        forInExpr11.patternGuard = UnaryExpr(quote(!a))
        forInExpr11.patternGuard.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr12 = ForInExpr(quote(for (a in A){}))
        let forInExpr122 = ForInExpr(quote(for (b in B){0}))
        forInExpr12.expr = forInExpr122.expr
        forInExpr12.expr.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let forInExpr13 = ForInExpr(quote(for (a in A){}))
        forInExpr13.keywordF.dump()
        forInExpr13.keywordF = Token(AND)
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
ASTException: Cannot construct the 'ForInExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: in, token_id: 111, token_literal_value: in, fileID: 1, line: 39, column: 49
ASTException: Illegal TokenKind, TokenKind should be IN
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 48, column: 46
ASTException: Illegal TokenKind, TokenKind should be LPAREN
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 57, column: 53
ASTException: Illegal TokenKind, TokenKind should be RPAREN
VarPattern {
  -identifier: Token {
    value: "b"
    kind: IDENTIFIER
    pos: 67: 48
  }
}
ForInExpr {
  -keywordF: Token {
    value: "for"
    kind: FOR
    pos: 76: 42
  }
  -pattern: VarPattern {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 76: 47
    }
  }
  -keywordI: Token {
    value: "in"
    kind: IN
    pos: 76: 49
  }
  -expr: RefExpr {
    -identifier: Token {
      value: "A"
      kind: IDENTIFIER
      pos: 76: 52
    }
  }
  -keywordW: Token {
    value: "where"
    kind: WHERE
    pos: 76: 54
  }
  -patternGuard: BinaryExpr {
    -leftExpr: RefExpr {
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 76: 60
      }
    }
    -op: Token {
      value: "!="
      kind: NOTEQ
      pos: 76: 62
    }
    -rightExpr: LitConstExpr {
      -literal: Token {
        value: "0"
        kind: INTEGER_LITERAL
        pos: 76: 65
      }
    }
  }
  -block: Block {
    -nodes: 0, LitConstExpr {
      -literal: Token {
        value: "0"
        kind: INTEGER_LITERAL
        pos: 77: 56
      }
    }
  }
}
description: illegal, token_id: 156, token_literal_value: , fileID: 0, line: 0, column: 0
UnaryExpr {
  -op: Token {
    value: "!"
    kind: NOT
    pos: 96: 52
  }
  -expr: RefExpr {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 96: 53
    }
  }
}
RefExpr {
  -identifier: Token {
    value: "B"
    kind: IDENTIFIER
    pos: 105: 54
  }
}
description: for, token_id: 104, token_literal_value: for, fileID: 1, line: 114, column: 43
ASTException: Illegal TokenKind, TokenKind should be FOR
cnt = 7
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
