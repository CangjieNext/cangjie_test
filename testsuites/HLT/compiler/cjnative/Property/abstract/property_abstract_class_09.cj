/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

abstract class A {
    mut static prop a: Int64
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_missing_func_body
// ASSERT: scan sema_invalid_member_visibility_in_class
