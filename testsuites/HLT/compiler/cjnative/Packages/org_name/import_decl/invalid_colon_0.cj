/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DESCRIPTION: 3 colons.
// DEPENDENCE: upstream_package.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt upstream_package.cj
// EXEC: %compiler %cmp_opt %f -L. -lmy_pkg@my_org -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan expected a '*' or identifier after '::' in qualified name, found ':'

import my_org:::my_pkg

main(): Unit {
    my_pkg.C().foo()
}
