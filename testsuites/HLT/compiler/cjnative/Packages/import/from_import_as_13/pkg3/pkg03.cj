/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
//DEPENDENCE: ../pkg1 ../pkg2
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/pkg01.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2/pkg03.cj -o pkg2.%middle
// EXEC: %compiler %cmp_opt %f pkg1.%middle  pkg2.%middle -o %output 2>&1
// RUN-EXEC: %run %run_opt %output %run_args

package pkg3

import {pkg1, pkg2}

func foo() {}

main(): Int64 {
    return 0
}
