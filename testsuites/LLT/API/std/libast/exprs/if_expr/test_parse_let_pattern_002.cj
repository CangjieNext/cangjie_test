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

main() {
    let input = quote(
        if (let (None, Some(Some(b))) <- value) {
        }
    )
    let expr = (parseExpr(input) as IfExpr).getOrThrow()
    let cond = expr.condition
    cond.toTokens().dump()
    return 0
}

// ASSERT: scan description: let, token_id: 91, token_literal_value: let
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: None
// ASSERT: scan description: comma, token_id: 1, token_literal_value:
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: Some
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: Some
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: b
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )
// ASSERT: scan description: backarrow, token_id: 45, token_literal_value: <-
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: value