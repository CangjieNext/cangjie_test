/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f

open class A {
    public let a: Int32 = 5
}

class B <: A {
    public let b = Array<Int32>(5, super.a)
}

main(): Int64 {
    let a = B()
    return 0
}
// ASSERT: scan sema_this_or_super_not_allowed_to_initialize_non_static_member
// ASSERT: scan sema_mismatched_types
