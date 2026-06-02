/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../pkga ../pkgb
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgb/pkgb.cj  -o pkgb.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkga.%middle pkgb.%middle  -o %output 2>&1 | compare %f

package pkg

import pkga.A
import pkgb.*

main(): Int64 {
    A<Int64>().plus(A<Int64>(), A<Int64>())
    return 2
}
// ASSERT: scan sema_not_member_of
