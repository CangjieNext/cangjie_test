/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main() {
    var tks = quote(var s = "test")
    println("tokens from quote:")
    tks.dump()

    tks = cangjieLex("a = 1")
    println("tokens from cangjieLex:")
    tks.dump()

    tks = Tokens().append(Token()).append(Token(TokenKind.IDENTIFIER, "a")).append(Token(TokenKind.INCR))
    println("tokens from Token():")
    tks.dump()
}

// ASSERT: regex tokens from quote:
// ASSERT: regex description: var, token_id: [0-9]+, token_literal_value: var
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: s
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =
// ASSERT: regex description: double_quoted_string_literal, token_id: [0-9]+, token_literal_value: test
// ASSERT: regex tokens from cangjieLex:
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: a
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 1
// ASSERT: regex tokens from Token\(\):
// ASSERT: regex description: illegal, token_id: [0-9]+, token_literal_value:
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: a
// ASSERT: regex description: incr, token_id: [0-9]+, token_literal_value: \+\+