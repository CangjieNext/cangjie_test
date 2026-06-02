/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    public A(let b!: Int64 = 0) {}
}

extend<T> A<T> <: I<Int32> {
    public static func me(a!: Int64 = b) {
    }
}

extend A<Int64> <: I<Int64> {
    public static func me(a!: Int64 = b) {
    }
}

interface I<T> {
    static func foo() {
    }
}

main(): Int64 {
    return 2
}
// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_static_function_cannot_access_non_static_member
// ASSERT: scan sema_interface_member_must_be_implemented
