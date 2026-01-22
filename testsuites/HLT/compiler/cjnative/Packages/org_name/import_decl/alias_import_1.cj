/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DESCRIPTION: alias import.
// DEPENDENCE: upstream_package.cj sub_pkg.cj sub_sub_pkg.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt upstream_package.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt sub_pkg.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt sub_sub_pkg.cj
// EXEC: %compiler %cmp_opt %f -L. -lmy_pkg@my_org -lmy_pkg.sub_pkg@my_org -lmy_pkg.sub_pkg.sub_sub_pkg@my_org -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import my_org::my_pkg.C as RootC
import my_org::my_pkg.sub_pkg.C as SubC
import my_org::my_pkg.sub_pkg.sub_sub_pkg.C as SubSubC

main(): Unit {
    RootC().foo()
    SubC().foo()
    SubSubC().foo()
}
