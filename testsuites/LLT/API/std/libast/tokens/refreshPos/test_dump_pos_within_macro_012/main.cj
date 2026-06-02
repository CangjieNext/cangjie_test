// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import define.*

main() {
    var fileName = @M(
        @sourceLine()
    )
    print(fileName)
    return 0
}

// ASSERT: regex description: at, token_id: [0-9]+, token_literal_value: @, fileID: 1, line: 8, column: 20
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: sourceLine, fileID: 1, line: 8, column: 20
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 1, line: 8, column: 20
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 1, line: 8, column: 20
// ASSERT: regex description: add, token_id: [0-9]+, token_literal_value: \+, fileID: 1, line: 8, column: 20
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 9, fileID: 1, line: 9, column: 9
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 1, line: 9, column: 22
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
