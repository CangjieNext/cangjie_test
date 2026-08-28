/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.*

main(): Int64 {
    var cnt = 0

    let input = quote(
        (A<Int64>)
    )
    try {
        TupleType(input)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        TupleType()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        TupleType(quote())
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let tupleType = TupleType(quote((Int64, String, Float64)))
        tupleType.lParen.dump()
        tupleType.rParen.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    0
}

// ASSERT: scan Cannot construct the 'TupleType' node
// ASSERT: scan parsing type error
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )
// ASSERT: scan cnt = 2