/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

interface A {
    mut func c(b: Int64): Int64

    mut func cc(b: Int64): Int64 {
        c(b)
    }
}

struct R <: A {
    public func c(b: Int64): Int64 {
        return 1
    }

    func cc(b: Int64): Int64 {
        c(b)
    }
}
// ASSERT: scan sema_incompatible_mut_modifier_between_struct_and_interface
// ASSERT: scan sema_weak_visibility
