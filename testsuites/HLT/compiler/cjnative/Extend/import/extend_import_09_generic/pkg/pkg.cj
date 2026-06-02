/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../pkga ../pkgb ../pkgc
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgc/pkgc.cj -o pkgc.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkga.%middle pkgb.%middle pkgc.%middle -o %output 2>&1 | compare %f

package pkg

import pkga.A
import pkgb.I
import pkgc.I2

main(): Int64 {
    A<Int64>().foo()
    return A<Int64>().plus(A<Int64>(), A<Int64>()) - 2
}
// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_ambiguous_match
