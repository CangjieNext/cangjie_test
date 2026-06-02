/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: pkg1_01.cj,pkg2_01.cj
// EXEC: %compiler %compile_lib_opt %cmp_opt pkg1_01.cj -o libpkg1.%middle
// EXEC: %compiler %compile_lib_opt %cmp_opt pkg2_01.cj -o libpkg2.%middle
// (not g) EXEC: %compiler %cmp_opt libpkg1.%middle %f -o %output
// (g) EXEC: %compiler %cmp_opt libpkg2.%middle %f -o %output
// (not g)RUN-EXEC: %run %run_opt %output %run_args
// (g)RUN-EXEC-1: %run %run_opt %output %run_args 

@When[!debug]
import pkg1.*
@When[debug]
import pkg2.*

main() {
    return a - 1
}
