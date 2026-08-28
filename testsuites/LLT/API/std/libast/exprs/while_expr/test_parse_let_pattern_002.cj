/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        while (let Some(v) <- a || true) {
            return v
        }
    )
    let whileExpr = (parseExpr(input) as WhileExpr).getOrThrow()
    let cond = whileExpr.condition
    cond.toTokens().dump()
    return 0
}
// ASSERT: scan description: let, token_id: 91, token_literal_value: let
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: Some
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: v
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )
// ASSERT: scan description: backarrow, token_id: 45, token_literal_value: <-
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: a
// ASSERT: scan description: or, token_id: 17, token_literal_value: ||
// ASSERT: scan description: bool_literal, token_id: 151, token_literal_value: true