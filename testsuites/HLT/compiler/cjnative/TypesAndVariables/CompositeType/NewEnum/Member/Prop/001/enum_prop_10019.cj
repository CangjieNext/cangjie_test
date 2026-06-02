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

    public prop a: Int64 {
        get() {
            1
        }
    }
    public func a() {}
}

main(): Int64 {
    var i = A.a(1, 2, 3)
    return i.a - 1
}
// ASSERT: scan sema_redefinition
// ASSERT: scan sema_invalid_enum_member_access
// ASSERT: scan sema_invalid_binary_expr
