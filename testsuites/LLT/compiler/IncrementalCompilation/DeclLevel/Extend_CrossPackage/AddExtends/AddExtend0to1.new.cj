package inc

public class A {
    public func foo(a: Int32): Int64 {
        1
    }
}

extend A {
    public func foo(a: Int64) {
        0
    }
}
main() {
    let a = A()
    a.foo(1)
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
