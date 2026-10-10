/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: test_lex_lambdaExpr_inMacro_define_001.cj
// EXEC: %compiler %cmp_macro test_lex_lambdaExpr_inMacro_define_001.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
import define.*

@M()

main() {
    0
}

// ASSERT: scan description: let, token_id: 91, token_literal_value: let
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: x
// ASSERT: scan description: assign, token_id: 30, token_literal_value: =
// ASSERT: scan description: l_curl, token_id: 6, token_literal_value: {
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: w
// ASSERT: scan description: colon, token_id: 28, token_literal_value: :
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: A
// ASSERT: scan description: less, token_id: 53, token_literal_value: <
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: T
// ASSERT: scan description: greater, token_id: 54, token_literal_value: >
// ASSERT: scan description: double_arrow, token_id: 46, token_literal_value: =>
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: w
// ASSERT: scan description: r_curl, token_id: 7, token_literal_value: }
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n