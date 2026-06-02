/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_def.cj
// EXEC: %compiler %cmp_macro macro_def.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*
let f1: (Int64, Int64)->Int64 = {@M(a: Int64, b: Int64) => a + b}


main(){
    return f1(1,0) - 1
}
// ASSERT: scan parse_expected_double_arrow_in_lambda
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_expr_or_decl_in
