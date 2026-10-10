/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ./test_totokens_002_dep.cj
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*
internal import std.fs.*
internal import std.io.*

main(): Int64 {
    let file: File = File("./test_totokens_002_dep.cj", Read)
    let reader = StringReader(file)
    let code: String = reader.readToEnd()
    let tokens = cangjieLex(code);
    let d = parseDecl(tokens)
    d.toTokens().dump()
    return 0;
}

// ASSERT: regex description: main, token_id: [0-9]+, token_literal_value: main
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \)
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :
// ASSERT: regex description: Int64, token_id: [0-9]+, token_literal_value: Int64
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: var, token_id: [0-9]+, token_literal_value: var
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: a
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 10
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: a
// ASSERT: regex description: decr, token_id: [0-9]+, token_literal_value: --
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: return, token_id: [0-9]+, token_literal_value: return
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 0
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n