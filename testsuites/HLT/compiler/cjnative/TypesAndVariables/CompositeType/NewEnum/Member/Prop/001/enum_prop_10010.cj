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

    public redef prop c: Int64 {
        get() {
            return 1
        }
        set(v) {}
    }
}

main(): Int64 {
    return A.c - 1
}
// ASSERT: scan sema_immutable_property_with_setter
// ASSERT: scan sema_redef_modify_static_func
// ASSERT: scan sema_illegal_access_non_static_member
