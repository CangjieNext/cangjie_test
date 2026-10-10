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
        Array<Int32>(10,2)
	)

    let arraysizedLit = parseExpr(input)

    let output = quote($arraysizedLit)
    output.dump()
    let flag = compareTokens(input, output)
    if (!flag) {
        return 1
    }

    0
}

// ASSERT: scan description: identifier, token_id: 137, token_literal_value: Array
// ASSERT: scan description: less, token_id: 53, token_literal_value: <
// ASSERT: scan description: Int32, token_id: 64, token_literal_value: Int32
// ASSERT: scan description: greater, token_id: 54, token_literal_value: >
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 10
// ASSERT: scan description: comma, token_id: 1, token_literal_value:
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 2
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )