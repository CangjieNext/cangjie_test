/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

class Base {
    public static func f(): Int32 {
        return 1
    }
    public static func get(): Int32 {
        return this.f()
    }
}
// (not iOS) ASSERT: scan sema_missing_entry
// ASSERT: scan sema_object_cannot_access_static_member
