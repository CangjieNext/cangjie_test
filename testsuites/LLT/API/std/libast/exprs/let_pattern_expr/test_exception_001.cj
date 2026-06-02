// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote(let a=1)
    try {
        let letPatternExpr1 = LetPatternExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(a++)
    try {
        let letPatternExpr2 = LetPatternExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr3 = LetPatternExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr4 = LetPatternExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr5 = LetPatternExpr(quote(let Some(v) <- a))
        letPatternExpr5.keyword.dump()
        letPatternExpr5.keyword = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr6 = LetPatternExpr(quote(let Some(v) <- a))
        let letPatternExpr66 = LetPatternExpr(quote(let Some(t) <- a))
        letPatternExpr6.pattern = letPatternExpr66.pattern
        letPatternExpr6.pattern.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr7 = LetPatternExpr(quote(let Some(v) <- a))
        letPatternExpr7.backArrow.dump()
        letPatternExpr7.backArrow = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let letPatternExpr8 = LetPatternExpr(quote(let Some(v) <- a))
        let letPatternExpr88 = LetPatternExpr()
        letPatternExpr8.expr = letPatternExpr88.expr
        letPatternExpr8.expr.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: 
[31merror[0m: expected '<-' in if-let expression, found '='
  [36m| [0m
  [36m| [0mlet a = 1[0m
  [36m| [0m      [31m^ expected '<-' here[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'LetPatternExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: let, token_id: 91, token_literal_value: let, fileID: 1, line: 39, column: 52
ASTException: Illegal TokenKind, TokenKind should be LET
EnumPattern {
  -constructor: RefExpr {
    -identifier: Token {
      value: "Some"
      kind: IDENTIFIER
      pos: 49: 57
    }
  }
  -patterns: 0, VarOrEnumPattern {
    -identifier: Token {
      value: "t"
      kind: IDENTIFIER
      pos: 49: 62
    }
  }
}
description: backarrow, token_id: 45, token_literal_value: <-, fileID: 1, line: 58, column: 64
ASTException: Illegal TokenKind, TokenKind should be BACKARROW
cnt = 5
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
