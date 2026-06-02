// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import std.ast.*
import def.*

main() {
    @M7(var y = 2)
}

// ASSERT: regex description: var, token_id: [0-9]+, token_literal_value: var, fileID: 1, line: 9, column: 9
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: y, fileID: 1, line: 9, column: 13
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 1, line: 9, column: 15
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 2, fileID: 1, line: 9, column: 17
// ASSERT: regex input tokens add Token: 
// ASSERT: regex description: var, token_id: [0-9]+, token_literal_value: var, fileID: 1, line: 9, column: 9
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: y, fileID: 1, line: 9, column: 13
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 1, line: 9, column: 15
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 2, fileID: 1, line: 9, column: 17
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 1, line: 9, column: 5
// ASSERT: regex input tokens add quote tokens: 
// ASSERT: regex description: var, token_id: [0-9]+, token_literal_value: var, fileID: 1, line: 9, column: 9
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: y, fileID: 1, line: 9, column: 13
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 1, line: 9, column: 15
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 2, fileID: 1, line: 9, column: 17
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 1, line: 9, column: 5
// ASSERT: regex description: var, token_id: [0-9]+, token_literal_value: var, fileID: 1, line: 9, column: 5
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: x, fileID: 1, line: 9, column: 5
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 1, line: 9, column: 5
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 1, fileID: 1, line: 9, column: 5
// ASSERT: regex description: semi, token_id: [0-9]+, token_literal_value: ;, fileID: 1, line: 9, column: 5
// ASSERT: regex input tokens add cangjieLex tokens: 
// ASSERT: regex description: var, token_id: [0-9]+, token_literal_value: var, fileID: 1, line: 9, column: 9
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: y, fileID: 1, line: 9, column: 13
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 1, line: 9, column: 15
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 2, fileID: 1, line: 9, column: 17
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 1, line: 9, column: 5
// ASSERT: regex description: var, token_id: [0-9]+, token_literal_value: var, fileID: 1, line: 9, column: 5
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: x, fileID: 1, line: 9, column: 5
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 1, line: 9, column: 5
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 1, fileID: 1, line: 9, column: 5
// ASSERT: regex description: semi, token_id: [0-9]+, token_literal_value: ;, fileID: 1, line: 9, column: 5
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: x, fileID: 1, line: 9, column: 5
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 1, line: 9, column: 5
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 2, fileID: 1, line: 9, column: 5
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
