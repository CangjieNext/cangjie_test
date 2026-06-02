/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T> {
    a(T)

    public static func foo() {
        this
    }
    public func test() {
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_static_members_cannot_call_members
