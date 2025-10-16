package inc

public class A<T> {}

extend<T> A<T> where T <: ToString {
    public func bar(): Int32 {
        1
    }
    public func foo(): Int64 {
        3
    }
}

extend<T> A<T> where T <: ToString {}

main() {
    let a = A<Int32>()
    a.foo() - Int64(a.bar())
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
