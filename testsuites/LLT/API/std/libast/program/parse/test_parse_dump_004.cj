/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ./test_parse_dump_004_dep.cj
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
import std.fs.*
import std.io.*
import std.ast.*

public func readfromFile(path: Path): String {
    let file: File = File(path, Read)
    let reader = StringReader(file)
    let code: String = reader.readToEnd()
    code
}

main(): Int64 {
    var code = readfromFile(Path("./test_parse_dump_004_dep.cj"));
    let ts = cangjieLex(code);
    ts.dump()
    println()
    let f = parseProgram(ts)
    let tokens = f.toTokens();
    tokens.dump()
    return 0;
}

// ASSERT: regex description: func, token_id: [0-9]+, token_literal_value: func
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: f
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \)
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: main, token_id: [0-9]+, token_literal_value: main
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \)
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :
// ASSERT: regex description: Int64, token_id: [0-9]+, token_literal_value: Int64
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: if, token_id: [0-9]+, token_literal_value: if
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(
// ASSERT: regex description: bool_literal, token_id: [0-9]+, token_literal_value: true
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \)
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: f
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }
// ASSERT: regex description: else, token_id: [0-9]+, token_literal_value: else
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: f
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \)
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: return, token_id: [0-9]+, token_literal_value: return
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 0
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex 
// ASSERT: regex description: func, token_id: [0-9]+, token_literal_value: func
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: f
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \)
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: main, token_id: [0-9]+, token_literal_value: main
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \)
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :
// ASSERT: regex description: Int64, token_id: [0-9]+, token_literal_value: Int64
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: if, token_id: [0-9]+, token_literal_value: if
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(
// ASSERT: regex description: bool_literal, token_id: [0-9]+, token_literal_value: true
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \)
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: f
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: else, token_id: [0-9]+, token_literal_value: else
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: f
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \)
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: return, token_id: [0-9]+, token_literal_value: return
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 0
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n
