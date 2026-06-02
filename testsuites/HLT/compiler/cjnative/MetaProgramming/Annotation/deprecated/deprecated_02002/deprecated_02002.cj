/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: a.cj
// EXEC:%compiler %cmp_opt %compile_lib_opt a.cj -o a.%middle
// EXEC-PIPE: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan sema_deprecated_warning

package use

import a.*

main() {
    A()
    return 0
}
