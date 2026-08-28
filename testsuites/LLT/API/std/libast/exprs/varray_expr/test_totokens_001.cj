/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main(): Int64 {
    let input = quote(
        let arr5: VArray<Int64, \$5> = VArray<Int64, \$5>{i => i}
    )
    var varray = (parseDecl(input) as VarDecl).getOrThrow()
    var initExpr = varray.expr
    initExpr.toTokens().dump()

    let input1 = quote(
        var varr: VArray<Int64, \$3> = VArray<Int64, \$3>(repeat: 1)
    )
    varray = (parseDecl(input1) as VarDecl).getOrThrow()
    initExpr = varray.expr
    initExpr.toTokens().dump()

    return 0
}

// ASSERT: scan description: VArray, token_id: 81, token_literal_value: VArray
// ASSERT: scan description: less, token_id: 53, token_literal_value: <
// ASSERT: scan description: Int64, token_id: 65, token_literal_value: Int64
// ASSERT: scan description: comma, token_id: 1, token_literal_value:
// ASSERT: scan description: dollar, token_id: 90, token_literal_value: $
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 5
// ASSERT: scan description: greater, token_id: 54, token_literal_value: >
// ASSERT: scan description: l_curl, token_id: 6, token_literal_value: {
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: i
// ASSERT: scan description: double_arrow, token_id: 46, token_literal_value: =>
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: i
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: r_curl, token_id: 7, token_literal_value: }
// ASSERT: scan description: VArray, token_id: 81, token_literal_value: VArray
// ASSERT: scan description: less, token_id: 53, token_literal_value: <
// ASSERT: scan description: Int64, token_id: 65, token_literal_value: Int64
// ASSERT: scan description: comma, token_id: 1, token_literal_value:
// ASSERT: scan description: dollar, token_id: 90, token_literal_value: $
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 3
// ASSERT: scan description: greater, token_id: 54, token_literal_value: >
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: repeat
// ASSERT: scan description: colon, token_id: 28, token_literal_value: :
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 1
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )