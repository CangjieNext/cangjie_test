/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj src/pkga/pkga2.cj -o ./pkga.%middle 2>&1 | compare %f

import pkga.*

main(): Int64 {
    if (pkga.x != 2) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_overload_conflicts
// ASSERT: scan sema_ambiguous_match
