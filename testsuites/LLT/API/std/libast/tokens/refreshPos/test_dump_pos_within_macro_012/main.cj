/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

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

// ASSERT: regex description: at, token_id: [0-9]+, token_literal_value: @
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: sourceLine
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \)
// ASSERT: regex description: add, token_id: [0-9]+, token_literal_value: \+
// ASSERT: regex description: integer_literal, token_id: [0-9]+, token_literal_value: 17
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n