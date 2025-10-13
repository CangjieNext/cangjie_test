open class A {
    mut prop a: Int64 {get() {3}; set(v) {print(v)} }
    func foo(public: Int64): Int64 { public-1}

    

    let gem:
    Int64
    =90
}

class B <: A {
    B(let b: Int64) {
        a = 15
    }
    static func gar(a: Int64): Int64 {a-1}
}

func user() {
    let a = A()
    a.foo(a.a)
}

func use2() {
    let b = B(6)
    b.foo(b.b-b.a)
}

func use3() {
    let b = B(9)
    print("${B.gar(b.gem)}")
}

main(): Unit {
    user()
    ()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
