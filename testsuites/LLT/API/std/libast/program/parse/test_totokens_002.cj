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

// ASSERT: regex description: main, token_id: [0-9]+, token_literal_value: main, fileID: 0, line: 1, column: 1
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 1, column: 5
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 1, column: 6
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :, fileID: 0, line: 1, column: 7
// ASSERT: regex description: Int64, token_id: [0-9]+, token_literal_value: Int64, fileID: 0, line: 1, column: 9
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {, fileID: 0, line: 1, column: 15
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 1, column: 16
// ASSERT: regex description: var, token_id: [0-9]+, token_literal_value: var, fileID: 0, line: 2, column: 5
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: a, fileID: 0, line: 2, column: 9
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 0, line: 2, column: 11
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 10, fileID: 0, line: 2, column: 13
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 2, column: 15
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: a, fileID: 0, line: 3, column: 5
// ASSERT: regex description: decr, token_id: [0-9]+, token_literal_value: --, fileID: 0, line: 3, column: 6
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 3, column: 8
// ASSERT: regex description: return, token_id: [0-9]+, token_literal_value: return, fileID: 0, line: 4, column: 5
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 0, fileID: 0, line: 4, column: 12
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 4, column: 13
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }, fileID: 0, line: 5, column: 1
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 5, column: 2
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
