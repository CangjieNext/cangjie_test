class A {
    func foo(a: Int32) { 0 }
}

type B = A
interface I {}

extend A <: I {
    func bar() {
        foo(1)
    }
}

main() {
    let a = A()
    a.bar()
}

extend B {
    func foo(a: Int64) {1}
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
