internal import p1.*

public interface I1 {
    func foo(a: Base): Int64
    func foo(a: Sub): Int64 {0}
}

extend A <: I1 {
    public func foo(a: Base): Int64 {0}
    //public func foo(a: Sub): Int64 {1}
}

func f(i: I1): Int64 {
    i.foo(Sub())
}

main() {
    let i : I1 = A()
    f(i)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
