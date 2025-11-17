/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package packageA

class A0 {}

class B0 {}

interface I0<T> {
    func foo(p: T): Unit {
        println("I0.foo")
    }
}

extend E0 <: I0<A0> & I0<B0> {
    public func foo(p: B0): Unit {
        println("C0.foo")
    }
}

enum E0 {
    | EC0
}

main(): Unit {
    let e0 = E0.EC0
    let a0 = A0()
    let b0 = B0()
    e0.foo(a0)
    e0.foo(b0)
}
