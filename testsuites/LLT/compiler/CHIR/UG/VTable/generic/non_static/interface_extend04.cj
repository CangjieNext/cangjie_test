// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface I2<K> {
    func f(a: K): K {
        a
    }
}

interface I<P> <: I2<(P, P)> {
    func foo(a: Int32): Int32
}

class A<X, Y> {
    public func foo(a: Y): Y {
        a
    }
}

extend<T> A<T, Int32> <: I<Int32> {}

main() {
    var x = A<Int64, Int32>()
    var y: (Int32, Int32) = (1, 2)
    x.f(y)[0] - x.foo(1)
}
