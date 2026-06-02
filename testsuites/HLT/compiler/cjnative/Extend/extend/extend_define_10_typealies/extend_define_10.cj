/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE:  pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/foo.cj -o pkg.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkg.%middle -o %n.%suffix 2>&1 | compare %f

import pkg.foo

type A = foo

extend A {}

main(): Int64 {
    return 1
}
// ASSERT: scan package_decl_not_find_in_package
