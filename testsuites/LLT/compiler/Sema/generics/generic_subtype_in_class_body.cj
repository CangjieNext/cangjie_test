// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f --output-type=staticlib -o %output

interface A<T> {}

class Foo<X, Y> <: A<X> {
    func g(a: A<Y>): Unit {}

    func f<Z>(foo: Foo<Y, Z>) {
        g(foo)
    }
}
