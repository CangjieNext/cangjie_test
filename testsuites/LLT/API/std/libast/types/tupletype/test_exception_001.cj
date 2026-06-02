// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

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

/* SCAN-IN
Cannot construct the 'TupleType' node.
parsing type error.
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 34, column: 41
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 34, column: 64
cnt = 2
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
