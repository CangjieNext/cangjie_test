/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt p1/a.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f a.%middle -o %output 2>&1 | compare %f

import p1.a

main(): Int64 {
    a++
    p1.a = 3
    return 0
}
// ASSERT: scan sema_cannot_assign_to_immutable
