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

package demo

import define.*

@Outer(Inner)

main() {
    println("test macro")
}

// ASSERT: scan -------position in Outer-------
// ASSERT: scan description: at, token_id: 51, token_literal_value: @
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: Inner
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: class, token_id: 85, token_literal_value: class
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: Demo
// ASSERT: scan description: l_curl, token_id: 6, token_literal_value: {
// ASSERT: scan description: r_curl, token_id: 7, token_literal_value: }