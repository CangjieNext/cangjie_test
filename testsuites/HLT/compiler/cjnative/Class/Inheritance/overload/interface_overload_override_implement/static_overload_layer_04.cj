/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

interface Base3 {
    func foo(): Int64
}

interface Data {
    func foo(a: Int32): Int64 {
        return 1
    }

    func foo(a: Int32): Bool {
        return a
    }
}

class Test <: Base3 & Data {}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_overload_conflicts
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl
// ASSERT: scan sema_inherit_member_type_inconsistent
