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
    @M[""[](0)
    @M[""]](0)
    @M[]""](0) 
    @M[[""](0)
    return 0
}
// ASSERT: scan parse_illegal_macro_expand_input_args_without_paren
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_expected_right_delimiter
