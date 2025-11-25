// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0
    let input = quote(
        A.B<Int64>
    )
    try {
        RefType(input)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        RefType()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        RefType(quote())
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let refType = RefType(quote(A<Int64>))
        refType.lAngle.dump()
        refType.rAngle.dump()
        refType.colon.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let refType = RefType(quote(B<Int64, Float64>))
        refType.commas = Tokens().append(Token(AND))
        refType.commas.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
Cannot construct the 'RefType' node.
parsing type error.
description: less, token_id: 53, token_literal_value: <, fileID: 1, line: 33, column: 38
description: greater, token_id: 54, token_literal_value: >, fileID: 1, line: 33, column: 44
description: colon, token_id: 28, token_literal_value: :, fileID: 27, line: 23, column: 33
Illegal TokenKind, TokenKind should be COMMA
cnt = 3
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
