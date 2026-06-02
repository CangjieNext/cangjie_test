/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_define_40025.cj
// EXEC: %compiler %cmp_macro macro_define_40025.cj
// EXEC: %run_macro %compiler %cmp_opt  %f %macro_debug -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

package test

import define_40025.X.*
import define_40025.X as define_40025X

main() {
    @define_40025X.X(0) + @X(0) + @define_40025X.Y[1](0) + @Y[1](0)
}
