/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main() {
    let input = quote(
        A({ elmtId, isInitialRender =>
                                Column { this.observeComponentCreation() }})
    )
    let expr = parseExpr(input).toTokens()
    expr.dump()
}

// ASSERT: scan description: identifier, token_id: 137, token_literal_value: A
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: l_curl, token_id: 6, token_literal_value: {
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: elmtId
// ASSERT: scan description: comma, token_id: 1, token_literal_value:
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: isInitialRender
// ASSERT: scan description: double_arrow, token_id: 46, token_literal_value: =>
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: Column
// ASSERT: scan description: l_curl, token_id: 6, token_literal_value: {
// ASSERT: scan description: this, token_id: 96, token_literal_value: this
// ASSERT: scan description: dot, token_id: 0, token_literal_value:
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: observeComponentCreation
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: r_curl, token_id: 7, token_literal_value: }
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: r_curl, token_id: 7, token_literal_value: }
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )