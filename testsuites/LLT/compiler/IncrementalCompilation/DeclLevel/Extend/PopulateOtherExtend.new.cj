package p1

public interface I1 {}

public func foo(a: Int32): Int64 {Int64(a+1)}
public struct A {
    public func bar() {
        foo(1)
    }
}

extend A <: I1 {
    public func jar() {
        foo(1)
    }
}

extend A {
    public func foo(a: Int64) {a+2}
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
