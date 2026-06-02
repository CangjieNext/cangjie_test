/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  return_one.cj
// EXEC: %compiler %cmp_macro return_one.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_macro_opt %run_args

import return_one.*

var a = @VAR_A(@VAR_C[0](0))
var b = @VAR_B @VAR_D[0]
var x = 1
var c = @VAR_C[0](@VAR_A(0))
var d = @VAR_D[0] @VAR_B
var x = 1

main() {
    a + b + c + d - 4
}
