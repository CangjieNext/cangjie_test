/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

extend<T> Option<T> {
    public operator func +<T>(right: T): T {
        return right
    }
}
// (not iOS) ASSERT: scan sema_missing_entry
// ASSERT: scan sema_generic_in_operator_overload
