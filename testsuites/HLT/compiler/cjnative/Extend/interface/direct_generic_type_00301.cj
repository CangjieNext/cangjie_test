/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {}

class B <: A {
    B(var b: Int64) {
    }
}

class C<T> where T <: A {}

extend<T> C<T> where T <: B {
    func foo<T>(a: T) {
        return a
    }

    static func foos<T>(a: T) {
        return a
    }
}

main() {
    C<A>.foos(B(1))
    C<A>().foo(B(1))
    return 1
}
// ASSERT: scan sema_not_member_of
