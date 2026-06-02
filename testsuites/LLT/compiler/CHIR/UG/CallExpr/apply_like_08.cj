// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f -o %n.%suffix

interface I {
    func foo(): Unit
}

class A<T> where T <: I {}

func goo<X>(a : X) where X <: A<X>{
    a.foo()
}

extend<T> A<T> <: I {
    public func foo(): Unit {
        println("A foo")
    }
}
main() {
    0
}