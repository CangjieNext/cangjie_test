struct A {
    
}
struct A2 {
    
}
struct A3 {
    
    func foo(a: Int32) {}
}

interface I1 {
    


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
    println(A.a)
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
