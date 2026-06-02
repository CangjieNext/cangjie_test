/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A {
    a(Int64, Int64, Int64)

    public static redef prop c: Int64 {
        get() {
            match (this) {
                case a(x, y, z) => x
                case _ => 0
            }
        }
        set(v) {}
    }
}

main(): Int64 {
    var i = A.a(1, 2, 3)
    return i.c - 1
}
// ASSERT: scan sema_missing_redefined_func
// ASSERT: scan sema_immutable_property_with_setter
// ASSERT: scan sema_static_members_cannot_call_members
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan sema_object_cannot_access_static_member
