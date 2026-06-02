/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_macro test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import test.*

main(){
    @M[-0_o0](0)
    @M[0o_1](0) 
    @M[0o_](0) 
    @M[0o8](0) 
    @M[0oa](0) 
    @M[00o0](0)
    @M[0o](0) 
    return 0
}
// ASSERT: scan lex_unknown_suffix
// ASSERT: scan lex_expected_digit
// ASSERT: scan lex_unexpected_digit
// ASSERT: scan lex_cannot_start_with_digit
