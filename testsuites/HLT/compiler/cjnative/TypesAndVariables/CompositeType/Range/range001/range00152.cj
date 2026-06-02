/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class A {
    public let a: Int32
    public let b: Int32
    public init() {
        this.a = 1
        this.b = 10
    }
    public let myRange = this()..this() : this()
    public let myRange2 = this..this : this
}

main(): Int64 {
    let a = A()
    return 1
}
// ASSERT: scan sema_invalid_this_call_outside_ctor
// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_this_or_super_not_allowed_to_initialize_non_static_member
// ASSERT: scan sema_mismatched_types
