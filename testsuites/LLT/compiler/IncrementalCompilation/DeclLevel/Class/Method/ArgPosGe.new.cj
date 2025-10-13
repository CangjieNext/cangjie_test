class A<T> {
    func foo(   a: Int32)
    : Unit {}
}
struct B<T> {
    mut prop bar: Int32 {
        get() { 0 }
        set(
                v 
        )
        {}
    }

    B(  a!: Int32)
    {}
}

enum C<T> {
    R|K(T)

    func too(   c: Int32,
        d!: Int32
    = 1)
    :Unit {}
}

main(
    args: Array<String>
): Int64 {
    0
}

interface D<T> {
    func foo(   a: Int32)
    : Unit {}
}

extend<T> C<T> <: D<T> {
    func bar(   g: Int32)
    : Unit {}
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
