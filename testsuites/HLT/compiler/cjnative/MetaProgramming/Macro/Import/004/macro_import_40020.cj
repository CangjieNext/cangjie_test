/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_define_40020.cj
// EXEC: %compiler %cmp_macro macro_define_40020.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f %macro_debug -o %output


package test
import define_40020.*

main(){
    @.X
    (0)
}
// ASSERT: scan parse_expected_expr_or_decl_in
