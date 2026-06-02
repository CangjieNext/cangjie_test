/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class B <: A {
    public func fooB2() {
        Int64(foo1(1)) + Int64(foo2(1)) + foo3() + foo4()
    }

    public func fooB1() {
        Int64(foo1(1)) + Int64(super.foo2(1)) + foo3() + super.foo4()
    }

    public func fooB3() {
        Int64(foo1(1)) + Int64(this.foo2(1)) + foo3() + this.foo4()
    }
}

open class A {}

extend A {
    public static func foo1(a: Int32, b!: Int64 = 0): Int32 {
        return a
    }
}

extend A {
    public func foo2(a: Int32, b!: Int64 = 0): Int32 {
        return a
    }
}

extend A {
    public static func foo3() {
        return 1
    }
}

extend A {
    public func foo4() {
        3
    }
}

main(): Int64 {
    return B().fooB1() + B().fooB2() + B().fooB3() - 18
}
