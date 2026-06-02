// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import define.*

func assertEqual(a: String, file: String, lines: Int64) {
    println("a:${a},file ${file}, line:${lines}")
}

main() {
    @Test
    @assert("1")
}

// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: assertEqual, fileID: 1, line: 13, column: 5
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 1, line: 13, column: 5
// ASSERT: regex description: double_quoted_string_literal, token_id: [0-9]+, token_literal_value: 1, fileID: 1, line: 13, column: 13
// ASSERT: regex description: comma, token_id: [0-9]+, token_literal_value: ,, fileID: 1, line: 13, column: 5
// ASSERT: regex description: at, token_id: [0-9]+, token_literal_value: @, fileID: 1, line: 13, column: 5
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: sourceFile, fileID: 1, line: 13, column: 5
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 1, line: 13, column: 5
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 1, line: 13, column: 5
// ASSERT: regex description: comma, token_id: [0-9]+, token_literal_value: ,, fileID: 1, line: 13, column: 5
// ASSERT: regex description: at, token_id: [0-9]+, token_literal_value: @, fileID: 1, line: 13, column: 5
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: sourceLine, fileID: 1, line: 13, column: 5
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 1, line: 13, column: 5
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 1, line: 13, column: 5
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 1, line: 13, column: 5
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
