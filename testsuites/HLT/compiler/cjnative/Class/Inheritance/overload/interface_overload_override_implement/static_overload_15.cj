/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

interface Data2 {
    static func foo(a: Int64): Int64 {
        return 2
    }
}

interface Data3 <: Data2 {
    static func foo(): Int64 {
        return 2
    }

    func foo(a: Int64): Int64
}

class Test <: Data3 {}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_static_function_overload_conflicts
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
// ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl
