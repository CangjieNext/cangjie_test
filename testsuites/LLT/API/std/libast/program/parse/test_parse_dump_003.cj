// DEPENDENCE: ./test_parse_dump_003_dep.cj
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.fs.*
internal import std.io.*
internal import std.ast.*

public func readfromFile(path: Path): String {
    let file: File = File(path, Read)
    let reader = StringReader(file)
    let code: String = reader.readToEnd()
    code
}

main(): Int64 {
    var code = readfromFile(Path("./test_parse_dump_003_dep.cj"));
    let ts = cangjieLex(code);
    ts.dump()
    println()
    let f = parseProgram(ts)
    let tokens = f.toTokens();
    tokens.dump()
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
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: flag, fileID: 0, line: 2, column: 9
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 0, line: 2, column: 14
// ASSERT: regex description: bool_literal, token_id: [0-9]+, token_literal_value: true, fileID: 0, line: 2, column: 16
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 2, column: 20
// ASSERT: regex description: if, token_id: [0-9]+, token_literal_value: if, fileID: 0, line: 3, column: 5
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 3, column: 8
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: flag, fileID: 0, line: 3, column: 9
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 3, column: 13
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {, fileID: 0, line: 3, column: 15
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 3, column: 16
// ASSERT: regex description: VArray, token_id: [0-9]+, token_literal_value: VArray, fileID: 0, line: 4, column: 9
// ASSERT: regex description: less, token_id: [0-9]+, token_literal_value: <, fileID: 0, line: 4, column: 15
// ASSERT: regex description: UInt16, token_id: [0-9]+, token_literal_value: UInt16, fileID: 0, line: 4, column: 16
// ASSERT: regex description: comma, token_id: [0-9]+, token_literal_value: ,, fileID: 0, line: 4, column: 22
// ASSERT: regex description: dollar, token_id: [0-9]+, token_literal_value: \$, fileID: 0, line: 4, column: 24
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 2, fileID: 0, line: 4, column: 25
// ASSERT: regex description: greater, token_id: [0-9]+, token_literal_value: >, fileID: 0, line: 4, column: 26
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 4, column: 27
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: item, fileID: 0, line: 4, column: 28
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :, fileID: 0, line: 4, column: 32
// ASSERT: regex description: UInt16, token_id: [0-9]+, token_literal_value: UInt16, fileID: 0, line: 4, column: 34
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 4, column: 40
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 5, fileID: 0, line: 4, column: 41
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 4, column: 42
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 4, column: 43
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 4, column: 44
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }, fileID: 0, line: 5, column: 5
// ASSERT: regex description: else, token_id: [0-9]+, token_literal_value: else, fileID: 0, line: 5, column: 7
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {, fileID: 0, line: 5, column: 12
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 5, column: 13
// ASSERT: regex description: VArray, token_id: [0-9]+, token_literal_value: VArray, fileID: 0, line: 6, column: 9
// ASSERT: regex description: less, token_id: [0-9]+, token_literal_value: <, fileID: 0, line: 6, column: 15
// ASSERT: regex description: UInt16, token_id: [0-9]+, token_literal_value: UInt16, fileID: 0, line: 6, column: 16
// ASSERT: regex description: comma, token_id: [0-9]+, token_literal_value: ,, fileID: 0, line: 6, column: 22
// ASSERT: regex description: dollar, token_id: [0-9]+, token_literal_value: \$, fileID: 0, line: 6, column: 24
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 2, fileID: 0, line: 6, column: 25
// ASSERT: regex description: greater, token_id: [0-9]+, token_literal_value: >, fileID: 0, line: 6, column: 26
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 6, column: 27
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: item, fileID: 0, line: 6, column: 28
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :, fileID: 0, line: 6, column: 32
// ASSERT: regex description: UInt16, token_id: [0-9]+, token_literal_value: UInt16, fileID: 0, line: 6, column: 34
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 6, column: 40
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 216, fileID: 0, line: 6, column: 41
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 6, column: 44
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 6, column: 45
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 6, column: 46
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }, fileID: 0, line: 7, column: 5
// ASSERT: regex description: l_square, token_id: [0-9]+, token_literal_value: \[, fileID: 0, line: 7, column: 6
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 0, fileID: 0, line: 7, column: 7
// ASSERT: regex description: r_square, token_id: [0-9]+, token_literal_value: \], fileID: 0, line: 7, column: 8
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 7, column: 9
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }, fileID: 0, line: 8, column: 1
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 8, column: 2

// ASSERT: regex description: main, token_id: [0-9]+, token_literal_value: main, fileID: 0, line: 1, column: 1
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 1, column: 5
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 1, column: 6
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :, fileID: 0, line: 1, column: 7
// ASSERT: regex description: Int64, token_id: [0-9]+, token_literal_value: Int64, fileID: 0, line: 1, column: 9
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {, fileID: 0, line: 1, column: 15
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 1, column: 16
// ASSERT: regex description: var, token_id: [0-9]+, token_literal_value: var, fileID: 0, line: 2, column: 5
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: flag, fileID: 0, line: 2, column: 9
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 0, line: 2, column: 14
// ASSERT: regex description: bool_literal, token_id: [0-9]+, token_literal_value: true, fileID: 0, line: 2, column: 16
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 2, column: 20
// ASSERT: regex description: if, token_id: [0-9]+, token_literal_value: if, fileID: 0, line: 3, column: 5
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 3, column: 8
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: flag, fileID: 0, line: 3, column: 9
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 3, column: 13
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {, fileID: 0, line: 3, column: 15
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 3, column: 16
// ASSERT: regex description: VArray, token_id: [0-9]+, token_literal_value: VArray, fileID: 0, line: 4, column: 9
// ASSERT: regex description: less, token_id: [0-9]+, token_literal_value: <, fileID: 0, line: 4, column: 15
// ASSERT: regex description: UInt16, token_id: [0-9]+, token_literal_value: UInt16, fileID: 0, line: 4, column: 16
// ASSERT: regex description: comma, token_id: [0-9]+, token_literal_value: ,, fileID: 0, line: 4, column: 23
// ASSERT: regex description: dollar, token_id: [0-9]+, token_literal_value: \$, fileID: 0, line: 4, column: 24
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 2, fileID: 0, line: 4, column: 25
// ASSERT: regex description: greater, token_id: [0-9]+, token_literal_value: >, fileID: 0, line: 4, column: 26
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 4, column: 27
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: item, fileID: 0, line: 4, column: 28
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :, fileID: 0, line: 4, column: 32
// ASSERT: regex description: UInt16, token_id: [0-9]+, token_literal_value: UInt16, fileID: 0, line: 4, column: 34
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 4, column: 40
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 5, fileID: 0, line: 4, column: 41
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 4, column: 42
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 4, column: 43
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 4, column: 44
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }, fileID: 0, line: 5, column: 5
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 5, column: 6
// ASSERT: regex description: else, token_id: [0-9]+, token_literal_value: else, fileID: 0, line: 5, column: 7
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {, fileID: 0, line: 5, column: 12
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 5, column: 13
// ASSERT: regex description: VArray, token_id: [0-9]+, token_literal_value: VArray, fileID: 0, line: 6, column: 9
// ASSERT: regex description: less, token_id: [0-9]+, token_literal_value: <, fileID: 0, line: 6, column: 15
// ASSERT: regex description: UInt16, token_id: [0-9]+, token_literal_value: UInt16, fileID: 0, line: 6, column: 16
// ASSERT: regex description: comma, token_id: [0-9]+, token_literal_value: ,, fileID: 0, line: 6, column: 23
// ASSERT: regex description: dollar, token_id: [0-9]+, token_literal_value: \$, fileID: 0, line: 6, column: 24
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 2, fileID: 0, line: 6, column: 25
// ASSERT: regex description: greater, token_id: [0-9]+, token_literal_value: >, fileID: 0, line: 6, column: 26
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 6, column: 27
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: item, fileID: 0, line: 6, column: 28
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :, fileID: 0, line: 6, column: 32
// ASSERT: regex description: UInt16, token_id: [0-9]+, token_literal_value: UInt16, fileID: 0, line: 6, column: 34
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 0, line: 6, column: 40
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 216, fileID: 0, line: 6, column: 41
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 6, column: 44
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 0, line: 6, column: 45
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 6, column: 46
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }, fileID: 0, line: 7, column: 5
// ASSERT: regex description: l_square, token_id: [0-9]+, token_literal_value: \[, fileID: 0, line: 7, column: 6
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 0, fileID: 0, line: 7, column: 7
// ASSERT: regex description: r_square, token_id: [0-9]+, token_literal_value: \], fileID: 0, line: 7, column: 8
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 7, column: 9
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }, fileID: 0, line: 8, column: 1
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 8, column: 2

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
