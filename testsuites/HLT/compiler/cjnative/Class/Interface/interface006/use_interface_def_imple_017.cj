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

open class A {}

class B <: A {}

interface MyInterface<T> {
    func foo1(): T
    func foo3(): T
    func foo2(a: T): T {
        foo1();
        a
    }
}

class myClass <: MyInterface<A> {
    var x: A = A()
    func f() {
        x = B()
        return x
    }
    public func foo1(): A {
        f()
    }
    public func foo3(): A {
        x
    }
}

main() {
    var s1: myClass = myClass()
    var s2: MyInterface<A> = myClass()
    if (s2.foo2(A()) is A && s2.foo3() is B && !(s1.foo2(A()) is B) && s1.x is B) {
        return 0
    } else {
        return 1
    }
}
