open class A {
    let a: Int64 = 3
    var b: Int64 = -1
    const c: Int64 = 0
    func foo() {}
    func foo(a: Int64) {println(a)}
    func bar(): Unit {}

    static func ram() {}
}

open class B <: A {
    let a: Int64 = 3

    func f1(){

    }
}

func foo(): Unit {
    let a = A()
    
    let b = B()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
