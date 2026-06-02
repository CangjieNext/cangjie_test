/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkga.%middle   -o %output 2>&1 | compare %f

import pkga.*

class Data <: Base {
    func foo(): Int32 {
        return 4
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
// ASSERT: scan sema_weak_visibility
