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
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output

import test.*

main(){
    var x = 1
    var a = @M(match (1) {
        case \$x => 0
    })
    return a
}
// ASSERT: scan parse_illegal_macro_expand_input_args
// ASSERT: scan parse_expected_expr_or_decl_in
// ASSERT: scan parse_expected_character
