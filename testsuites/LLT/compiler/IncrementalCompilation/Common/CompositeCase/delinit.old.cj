open class A1 {
    
    init() { a++ }

    static init() {
        println("clinit A")
    }

    static var a: Int64 = 11

    func foo() {
        println("tell ${a}")
    }
}

open class B1 <: A1 {
    static init() {
        println("clinit B")
    }

    init(a: Int64) {
        println("init B with ${a}")
    }
}

func foo(): Unit {
    let b = B1(9)
    b.foo()
}

main() {
    foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
