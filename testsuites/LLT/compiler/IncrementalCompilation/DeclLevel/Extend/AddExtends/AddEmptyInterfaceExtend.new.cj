class A {}
interface I1 {}
interface I2 {
    func foo(a: Int64): Int64 {
        return a+1
    }
}

extend A {
    public func foo(a: Int32): Int64 { Int64(a) }
}

extend A {
    public func bar(): Int64 { 2 }
}

func use1(): Int64 {
    let a = A()
    a.foo(1)
}

func boxuse(): Int64 {
    let a: Any = A()
    (a as A).getOrThrow().bar()
}

main(): Int64 {
    boxuse() - use1()
}

extend A <: I1 {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
