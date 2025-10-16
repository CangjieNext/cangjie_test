package p1

public struct A {
    public A(let b: B) {}
}

public struct B {
    public B(let b: Int64) {}
}

public enum E1 {
    R|K(A)
}

public func getValue(a: Int64) { a }
public func getValue(a: E1): Int64 {
    if (let K(r) <- a) {
        getValue(r.b.b) + 1
    } else {
        -1
    }
}

public func u1(): Int64 {
    getValue(K(A(B(0))))
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
