
struct A {}
interface I1 {
    func foo(): Int64 
}

extend A {
    func jam(): Int64 {2}

    func shoot(): Int64 {3}
}

extend A {

}

extend A <: I1 {
    public func foo(): Int64 {1}
}

main() {
    let a: I1 = A() // box it
    let b = (a as A).getOrThrow()
    b.shoot()-b.jam()-a.foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
