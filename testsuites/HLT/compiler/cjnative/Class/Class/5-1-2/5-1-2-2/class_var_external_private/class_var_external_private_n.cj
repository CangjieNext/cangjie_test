/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %n.%middle 2>&1 | compare %f

package class_var_public_default

import pkg

main(): Int64 {
    let a = pkg.Data().a
    if (a != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_invalid_access_control
