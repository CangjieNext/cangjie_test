struct A {
    let a: Int64 = 1
}
struct A2 {
    static const a: Int32 = 7
}
struct A3 {
    func foo(a: Int64) {}
    func foo(a: Int32) {}
}

interface I1 {
    func jar() {
        println("i1 jar")
    }
    static func jom() {}
}
struct A4 <: I1 {
    public func jar() {
        println("a4 jar")
    }
}


main() {}

func u1() {
    let a = A()
    println(a.a)
}

func u2() {
    let a = A3()
    println(a.foo(7))
}

func u3() {
    let a = A4()
    a.jar()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
