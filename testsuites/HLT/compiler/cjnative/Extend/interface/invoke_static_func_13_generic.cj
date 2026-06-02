/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class B<T> {
    var c = 0

    func bbb() {
    }
}

class A<T> <: B<T> {
    public A(let b!: Int32 = 0) {
    }
}

interface I<T> {
    static func foo() {
    }
}

extend<T> A<T> <: I<T> {
    public static func me() {
        super.c
        super.bbb()
        super.foo()
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_static_members_cannot_call_members
// ASSERT: scan sema_extend_use_super
