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
    return Int64(Data().foo())
}

open class Base1 {
    public static func foo() {}
}

abstract class Base <: Base1 {
    private func foo(): Int32
}

class Data <: Base {
    public func foo(): Int32 {
        return 0
    }
}
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
// ASSERT: scan sema_invalid_member_visibility_in_class
// ASSERT: scan sema_return_type_incompatible
