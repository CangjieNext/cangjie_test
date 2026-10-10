/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// DEPENDENCE: define1.cj define2.cj
// EXEC: %compiler %cmp_macro define1.cj
// EXEC: %compiler %cmp_macro define2.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

package demo

import s1.*
import s2.*

@Call2
class Demo {
    var state = 1
}

main() {
    println("test macro")
}

// ASSERT: scan -------position in Call2-------
// ASSERT: scan description: at, token_id: 51, token_literal_value: @
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: Call1
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan -------position in Call1-------
// ASSERT: scan description: let, token_id: 91, token_literal_value: let
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: namespace
// ASSERT: scan description: colon, token_id: 28, token_literal_value: :
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: String
// ASSERT: scan description: assign, token_id: 30, token_literal_value: =
// ASSERT: scan description: at, token_id: 51, token_literal_value: @
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: sourcePackage
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n