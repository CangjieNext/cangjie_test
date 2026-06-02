/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f  pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f

import {pkga.one, pkgb.one}

main(): Int64 {
    let a = one
    if (a != 1) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_ambiguous_use
