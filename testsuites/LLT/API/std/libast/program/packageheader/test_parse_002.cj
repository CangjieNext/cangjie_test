// DEPENDENCE: ./test_parse_002_dep.cj
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*
internal import std.fs.*
internal import std.io.*

main(): Int64 {
    let file: File = File("./test_parse_002_dep.cj", Read)
    let reader = StringReader(file)
    let code: String = reader.readToEnd()
    let tokens = cangjieLex(code);
    let f: Program = parseProgram(tokens);
    f.packageHeader.toTokens().dump()
    return 0;
}

// ASSERT: regex description: package, token_id: [0-9]+, token_literal_value: package, fileID: 0, line: 1, column: 1
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: default, fileID: 0, line: 1, column: 9
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 0, line: 1, column: 16
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
