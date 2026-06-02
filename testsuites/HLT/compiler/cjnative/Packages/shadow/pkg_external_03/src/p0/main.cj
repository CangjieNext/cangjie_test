/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../p1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle 2>&1 | compare %f

package p0

import p1.foo

main(): Int64 {
    return 0
}
// ASSERT: scan sema_accessibility
