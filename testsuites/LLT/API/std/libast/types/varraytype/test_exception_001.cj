// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0

    let input = quote(
        A
    )
    try {
        VArrayType(input)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        VArrayType()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        VArrayType(quote())
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let vArrayType = VArrayType(quote(VArray<Int32, \$10>))
        vArrayType.lAngle.dump()
        vArrayType.lAngle = Token(AND)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let vArrayType = VArrayType(quote(VArray<Int32, \$10>))
        vArrayType.rAngle.dump()
        vArrayType.rAngle = Token(AND)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let vArrayType = VArrayType(quote(VArray<Int32, \$10>))
        let vArrayType1 = VArrayType(quote(VArray<Float64, \$5>))
        vArrayType.elementTy = vArrayType1.elementTy
        vArrayType.elementTy.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let vArrayType = VArrayType(quote(VArray<Int32, \$10>))
        vArrayType.size = Token(AND)
        vArrayType.size.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let vArrayType = VArrayType(quote(VArray<Int32, \$10>))
        vArrayType.dollar.dump()
        vArrayType.dollar = Token(AND)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

/* SCAN-IN
Cannot construct the 'VArrayType' node.
parsing type error.
description: less, token_id: 53, token_literal_value: <, fileID: 1, line: 34, column: 49
Illegal TokenKind, TokenKind should be LT
description: greater, token_id: 54, token_literal_value: >, fileID: 1, line: 43, column: 61
Illegal TokenKind, TokenKind should be GT
PrimitiveType {
  -keyword: Token {
    value: "Float64"
    kind: FLOAT64
    pos: 53: 51
  }
}
description: and, token_id: 16, token_literal_value: &&, fileID: 1, line: 63, column: 27
description: dollar, token_id: 90, token_literal_value: $, fileID: 1, line: 71, column: 58
Illegal TokenKind, TokenKind should be DOLLAR
cnt = 5
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
