// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        1..2:=3
    )
    try {
        let rangeExpr1 = RangeExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        2==2
    )
    try {
        let rangeExpr2 = RangeExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let rangeExpr3 = RangeExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let rangeExpr4 = RangeExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let rangeExpr5 = RangeExpr(quote(1..2))
        rangeExpr5.end.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let rangeExpr6 = RangeExpr(quote(1..2))
        rangeExpr6.start.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let rangeExpr7 = RangeExpr()
        rangeExpr7.step.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let rangeExpr8 = RangeExpr(quote(1..3 : 4))
        rangeExpr8.colon.dump()
        rangeExpr8.colon = Token(AND)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let rangeExpr9 = RangeExpr(quote(1..3 : 4))
        rangeExpr9.op = Token(AND)
        rangeExpr9.op.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: 
[31merror[0m: expected expression after ':', found '='
  [36m| [0m
  [36m| [0m1 .. 2: = 3[0m
  [36m| [0m        [31m^ expected expression here[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'RangeExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
LitConstExpr {
  -literal: Token {
    value: "2"
    kind: INTEGER_LITERAL
    pos: 43: 45
  }
}
LitConstExpr {
  -literal: Token {
    value: "1"
    kind: INTEGER_LITERAL
    pos: 51: 42
  }
}
ASTException: Current range expr cannot get step
description: colon, token_id: 28, token_literal_value: :, fileID: 1, line: 67, column: 47
ASTException: Illegal TokenKind, TokenKind should be COLON
description: and, token_id: 16, token_literal_value: &&, fileID: 1, line: 77, column: 25
cnt = 5
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
