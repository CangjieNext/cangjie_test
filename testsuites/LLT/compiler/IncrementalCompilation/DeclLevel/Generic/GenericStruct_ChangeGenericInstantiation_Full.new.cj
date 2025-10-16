struct A<T> {
    mut func foo(a: T): Int64 { 0 }
}
func foo(): Int64 {
    var a = A<(Int32, A<A<A<Int64>>>)>()
    return a.foo((Int32(333), A()))
}
main(): Int64 { foo() }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
