package inc

public class A<T> {}

extend<T> A<T> where T <: ToString {
    public func foo(a: Int32): Int64 {
        2
    }
}

// extend<T> A<T> where T <: ToString {
//     func foo(a: Int64): Int64 { 1 }
// }

main() {
    let a = A<Int32>()
    a.foo(3)
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
