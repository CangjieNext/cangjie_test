/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

open class A {
    public let a: Int64 = 5
}

class B <: A {
    public let myArray = Array<Int32>(super.a, 0)
}

main(): Int64 {
    let a = B()
    return 0
}
// ASSERT: scan sema_this_or_super_not_allowed_to_initialize_non_static_member
// ASSERT: scan sema_cannot_convert_literal
