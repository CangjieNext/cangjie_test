// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

import define.*

main() {
    @M()
    a = 2
}

// ASSERT: regex description: var, token_id: [0-9]+, token_literal_value: var, fileID: 1, line: 9, column: 5
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: a, fileID: 1, line: 9, column: 5
// ASSERT: regex description: assign, token_id: [0-9]+, token_literal_value: =, fileID: 1, line: 9, column: 5
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 1, line: 9, column: 5
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 1, fileID: 1, line: 9, column: 5
// ASSERT: regex description: add, token_id: [0-9]+, token_literal_value: \+, fileID: 1, line: 9, column: 5
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 1, fileID: 1, line: 9, column: 5
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 1, line: 9, column: 5
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
