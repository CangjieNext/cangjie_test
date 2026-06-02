// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        VArray<Int64, \$a>{i => i}
    )
    try {
        let varrayExpr1 = VArrayExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        Array<Int64>(3, item: 0)
    )
    try {
        let varrayExpr2 = VArrayExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let vArrayExpr3 = VArrayExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let vArrayExpr4 = VArrayExpr(quote())
        println(vArrayExpr4.toTokens().size)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let vArrayExpr5 = VArrayExpr(quote(VArray<Int64, \$6>(3, item: 0)))
        vArrayExpr5.lParen.dump()
        vArrayExpr5.lParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let vArrayExpr6 = VArrayExpr(quote(VArray<Int64, \$6>(3, item: 0)))
        vArrayExpr6.rParen.dump()
        vArrayExpr6.rParen = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let vArrayExpr7 = VArrayExpr()
        let vArrayExpr77 = VArrayExpr(quote(VArray<Float64, \$5>({i => i})))
        vArrayExpr7.arguments = vArrayExpr77.arguments
        println(vArrayExpr7.arguments.size)
        vArrayExpr7.vArrayType = vArrayExpr77.vArrayType
        vArrayExpr7.vArrayType.dump()
        vArrayExpr77.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: 
[31merror[0m: expected a '$' follows an integer literal as the second generic argument between '<' and '>' of 'VArray' type
  [36m| [0m
  [36m| [0mVArray < Int64, $a > { i => i }[0m
  [36m| [0m                [31m^^ [0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'VArrayExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 44, column: 62
ASTException: Illegal TokenKind, TokenKind should be LPAREN
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 53, column: 73
ASTException: Illegal TokenKind, TokenKind should be RPAREN
1
VArrayType {
  -VARRAY: Token {
    value: "VArray"
    kind: VARRAY
    pos: 63: 45
  }
  -elementTy: PrimitiveType {
    -keyword: Token {
      value: "Float64"
      kind: FLOAT64
      pos: 63: 52
    }
  }
  -dollar: Token {
    value: "$"
    kind: DOLLAR
    pos: 63: 62
  }
  -size: Token {
    value: "5"
    kind: INTEGER_LITERAL
    pos: 63: 63
  }
}
VArrayExpr {
  -vArrayType: VArrayType {
    -VARRAY: Token {
      value: "VArray"
      kind: VARRAY
      pos: 63: 45
    }
    -elementTy: PrimitiveType {
      -keyword: Token {
        value: "Float64"
        kind: FLOAT64
        pos: 63: 52
      }
    }
    -dollar: Token {
      value: "$"
      kind: DOLLAR
      pos: 63: 62
    }
    -size: Token {
      value: "5"
      kind: INTEGER_LITERAL
      pos: 63: 63
    }
  }
  -arguments: 0, Argument {
    -expr: LambdaExpr {
      -funcParams: 0, FuncParam {
        -identifier: Token {
          value: "i"
          kind: IDENTIFIER
          pos: 63: 67
        }
        -paramType:       }
      -doubleArrow: Token {
        value: "=>"
        kind: DOUBLE_ARROW
        pos: 63: 69
      }
      -nodes: 0, RefExpr {
        -identifier: Token {
          value: "i"
          kind: IDENTIFIER
          pos: 63: 72
        }
      }
    }
  }
}
cnt = 5
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
