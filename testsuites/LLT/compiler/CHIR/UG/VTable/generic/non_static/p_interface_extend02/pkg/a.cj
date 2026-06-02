// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public interface I2<K> {
    func f(a: K): K {
        a
    }
}

public interface I<P> <: I2<(P, P)> {
    func foo(a: Int32): Int32
}

public class A<X, Y> {
    public func foo(a: Y): Y {
        a
    }
}

extend<T> A<T, Int32> <: I<Int32> {}
