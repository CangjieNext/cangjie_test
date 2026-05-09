/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: define.cj pkg1.cj
// EXEC: %compiler %compile_lib_opt pkg1.cj 
// EXEC: %compiler %cmp_macro -L ./ -lpkg1 define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output

// RUN-EXEC: %run %run_opt %output %run_args

import define.*

main(): Int64 {
    var b = @Outer(@Inner(1))

    return b - 1
}
