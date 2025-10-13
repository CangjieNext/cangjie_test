interface I1 {
    func foo() {
        println("I1 foo")
    }
}
interface I2 {
    func foo() {
        println("I2 foo")
    }
}

struct A1 {}

extend A1 <: I2 {
    public func foo() {
        println("extend A1 foo")
    }
}
struct A2 {}
extend A2 <: I1 {}

main() {
    let a = A1()
    a.foo()
    let a2 = A2()
    a2.foo()
}

// ASSERT: scan extend A1 foo
// ASSERT: scan I1 foo


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
