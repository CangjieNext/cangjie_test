class A {
    func foo(): Int64 { 3 }
    static init() {
println(30)
    }
    init(v: Int32) {
println(30)
    }

    A() {
println(30)
    }

    ~init() {
println(30)
    }

    static mut prop f: Int32 {
        get() {
            println(30);1
        }
        set(v) {
            println(30)
        }
    }
}

enum B {
    R|K(Int32)

    func foo(): Unit {
println(30)
    }
    prop f: Int32 {
        get() {
            println(30);1
        }
    }
}
main(): Int64 {
    println(30)
    return A().foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
