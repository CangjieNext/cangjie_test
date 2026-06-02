/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan Base1.foo()

interface Inter1 {
    func foo(): Unit {
        print("Inter1.foo()")
    }
}

interface Inter2 <: Inter1 {
    func foo(): Unit {
        print("Inter2.foo()")
    }
}

open class Base1 <: Inter1 {
    public func foo(): Unit {
        print("Base1.foo()")
    }
}

open class Base2 <: Base1 & Inter2 {}

class Derived <: Base2 {}

class InterfaceTest {
    public func test(inf: Inter1): Unit {
        inf.foo()
    }
}

main(): Int64 {
    var it: InterfaceTest = InterfaceTest()
    var o1: Derived = Derived()
    it.test(o1)
    return 0
}
