/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC-PIPE: %run_macro %compiler %cmp_opt %macro_lib -Woff unused %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output  %run_args

import {define.*, std.ast.*}

@M
func f(_: Int64): Unit {
}

main() {
}

// ASSERT: regex description: func, token_id: [0-9]+, token_literal_value: func, fileID: 1, line: 18, column: 1
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: f, fileID: 1, line: 18, column: 6
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 1, line: 18, column: 7
// ASSERT: regex description: wildcard, token_id: [0-9]+, token_literal_value: _, fileID: 1, line: 18, column: 8
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :, fileID: 1, line: 18, column: 9
// ASSERT: regex description: Int64, token_id: [0-9]+, token_literal_value: Int64, fileID: 1, line: 18, column: 11
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 1, line: 18, column: 16
// ASSERT: regex description: colon, token_id: [0-9]+, token_literal_value: :, fileID: 1, line: 18, column: 17
// ASSERT: regex description: Unit, token_id: [0-9]+, token_literal_value: Unit, fileID: 1, line: 18, column: 19
// ASSERT: regex description: l_curl, token_id: [0-9]+, token_literal_value: {, fileID: 1, line: 18, column: 24
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 1, line: 18, column: 25
// ASSERT: regex description: r_curl, token_id: [0-9]+, token_literal_value: }, fileID: 1, line: 19, column: 1

