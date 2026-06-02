/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface A<T> {
    func a_foo(a: T): T
    func d_foo(a: T): T {
        a
    }
}

interface B<T> {
    func a_foo(a: T): T
    func d_foo(a: T): T {
        a
    }
}

interface C<X> <: A<Int32> & B<Int32> {}

class D <: C<Int32> {
    public func a_foo(a: Int32): Int32 {
        1
    }
}

main() {
    var i: C<Int32> = D()
    if (i.a_foo(Int32(1)) != Int32(1)) {
        print("a_foo failed")
        return 1
    }
    if (i.d_foo(Int32(2)) != Int32(2)) {
        print("d_foo failed")
        return 1
    }
    return 0
}
// ASSERT: scan sema_interface_member_must_be_implemented
