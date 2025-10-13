interface I1 {
    func foo() {println("I1 foo")}
}

open class A {
    func foo(a: Int64) {println(a)}
}

extend A <: I1 {

}

class B <: A {}

main() {
    let b = B()
    b.foo()
}

// ASSERT: scan I1 foo


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
