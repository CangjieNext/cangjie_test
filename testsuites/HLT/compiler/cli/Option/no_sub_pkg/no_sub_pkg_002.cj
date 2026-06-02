/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkg -o ./p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt --no-sub-pkg p1.%middle %pkg_opt pkg/subpkg -o ./p2.%middle

//  EXEC: %compiler %cmp_opt p2.%middle p1.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package p

import p.pkg.subpkg.*

main() {
    a - 1
}
