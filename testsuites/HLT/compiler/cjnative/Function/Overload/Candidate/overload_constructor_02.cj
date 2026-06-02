/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return 0
}

// 同名同参数数量同参数类型，不可重载
enum TimeUnit1 {
    foo(Int32) | foo(Int32)
}

// 同名同参数数量不同参数类型，不可重载
enum TimeUnit2 {
    foo(Int32) | foo(Int64)
}
// ASSERT: scan sema_duplicated_item_in_enum
// ASSERT: scan sema_overload_conflicts
