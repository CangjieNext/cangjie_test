/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return 0
}

abstract class Base {
    public func foo(): Int32
}

class Data <: Base {
    public static func foo(): Int32 {
        return 4
    }
}
// ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
