/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface A {
    func a_foo(a: Int32): Int32
    func d_foo(a: Int32): Int32 {
        a
    }
    static func s_foo(a: Int32): Int32 {
        a
    }
}

interface B<T> {
    func a_foo(a: T): T
    func d_foo(a: T): T {
        a
    }
    static func s_foo(a: T): T {
        a
    }
}

interface C <: A & B<Int32> {}

class Test <: C {
    public func a_foo(a: Int32): Int32 {
        a
    }
}

class D <: C {
    public func a_foo(a: Int32): Int32 {
        1
    }
}

main() {
    var i: C = D()
    if (i.a_foo(Int32(1)) != Int32(1)) {
        print("a_foo failed")
        return 1
    }
    if (i.d_foo(Int32(2)) != Int32(2)) {
        print("d_foo failed")
        return 1
    }
    if (Test.s_foo(Int32(3)) != Int32(3)) {
        print("s_foo failed")
        return 1
    }
    return 0
}
// ASSERT: scan sema_interface_member_must_be_implemented
