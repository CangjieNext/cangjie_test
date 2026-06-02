/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj -o ./pkgb.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj  ./pkgb.%middle -o ./pkga.%middle 2>&1  | compare %f

package pkga

import pkgb

func foo() {
    pkgb.x++
    pkgb.y++
    pkgb.z++
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_invalid_access_control
