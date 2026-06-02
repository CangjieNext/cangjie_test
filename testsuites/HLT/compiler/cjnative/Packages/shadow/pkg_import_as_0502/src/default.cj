/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgb/*.cj -o pkgb.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f

import pkga as alias
import pkgb.b1 as alias
import pkgb.b2 as alias

main(): Int64 {
    var m1 = alias.a
    var m2 = alias
    return 0
}
// ASSERT: scan sema_ambiguous_use
