/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {
    public let a: Int32 = 1
    public let b: Int32 = this.a + 9
    public let myRange = this.a..this.b : this.a
}

class B <: A {
    public let myRange = super.a..super.b : super.a
}

main(): Int64 {
    let b = B()
    return 0
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_this_or_super_not_allowed_to_initialize_non_static_member
