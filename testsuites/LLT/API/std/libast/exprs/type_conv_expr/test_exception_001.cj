// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let tokens1 = quote( 
        Int32[100]
    )
    try {
        let typeConvExpr1 = TypeConvExpr(tokens1)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    let tokens2 = quote(
        String("33")
    )
    try {
        let typeConvExpr2 = TypeConvExpr(tokens2)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let typeConvExpr3 = TypeConvExpr()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let typeConvExpr4 = TypeConvExpr(quote())
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let typeConvExpr5 = TypeConvExpr(quote(Float64(1+4)))
        typeConvExpr5.lParen.dump()
        typeConvExpr5.lParen = Token(OR)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let typeConvExpr6 = TypeConvExpr(quote(Float64(1+4)))
        typeConvExpr6.rParen.dump()
        typeConvExpr6.rParen = Token(OR)
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let typeConvExpr7 = TypeConvExpr(quote(Float64(1+4)))
        let typeConvExpr77 = TypeConvExpr(quote(Int64(3.0)))
        typeConvExpr7.expr = typeConvExpr77.expr
        typeConvExpr7.expr.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    try {
        let typeConvExpr8 = TypeConvExpr(quote(Float64(1+4)))
        typeConvExpr8.targetType = PrimitiveType(quote(Int32))
        typeConvExpr8.targetType.dump()
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
ASTException: 
[31merror[0m: expected expression after '', found keyword 'Int32'
  [36m| [0m
  [36m| [0mInt32[100][0m
  [36m| [0m[31m^^^^^ expected expression here[0m
  [36m| [0m

parsing expr error.
ASTException: Cannot construct the 'TypeConvExpr' node.
ASTException: 
[31merror[0m: expected expression after '', found '<EOF>'
 [36m==>[0m :1:1:

parsing expr error.
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 43, column: 55
ASTException: Illegal TokenKind, TokenKind should be LPAREN
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 52, column: 59
ASTException: Illegal TokenKind, TokenKind should be RPAREN
LitConstExpr {
  -literal: Token {
    value: "3.0"
    kind: FLOAT_LITERAL
    pos: 62: 55
  }
}
PrimitiveType {
  -keyword: Token {
    value: "Int32"
    kind: INT32
    pos: 72: 56
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
