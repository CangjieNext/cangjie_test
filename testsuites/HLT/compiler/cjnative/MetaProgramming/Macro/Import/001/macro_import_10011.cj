/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_define_10011.cj
// EXEC: %compiler %cmp_macro macro_define_10011.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

package test

import define_10011.X as x

main() {
    @X(0) + @x(0)
}
// ASSERT: scan macro_undeclared_identifier
