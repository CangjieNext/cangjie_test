/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: test_parse_001_define.cj
// EXEC: %compiler %cmp_macro test_parse_001_define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_lib %f -Woff unused -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

import macro_def.*

@M1
@M0
class A {
    ~init() {}
}

main(): Int64 {
    return 0
}


// ASSERT: scan description: class, token_id: 85, token_literal_value: class
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: A
// ASSERT: scan description: l_curl, token_id: 6, token_literal_value: {
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: bit_not, token_id: 25, token_literal_value: ~
// ASSERT: scan description: init, token_id: 95, token_literal_value: init
// ASSERT: scan description: l_paren, token_id: 2, token_literal_value: (
// ASSERT: scan description: r_paren, token_id: 3, token_literal_value: )
// ASSERT: scan description: l_curl, token_id: 6, token_literal_value: {
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: r_curl, token_id: 7, token_literal_value: }
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: r_curl, token_id: 7, token_literal_value: }
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n