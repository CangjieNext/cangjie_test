/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DESCRIPTION: all import.
// DEPENDENCE: upstream_package.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt upstream_package.cj
// EXEC-PIPE-1: %compiler %cmp_opt %f -L. -lmy_pkg@my_org -o %output 2>&1 | compare %f
// ASSERT: scan can not find package 'my_org'

import my_org.*

main(): Unit {
    C().foo()
}
