// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface I<P> {
    func foo(a: Int32): Int32
}

class A<X, Y> {}

extend A<Int64, Int32> <: I<Int32> {}

extend<M, N> A<M, N> {
    public func foo(a: Int32): Int32 {
        a
    }
}

main() {
    var x: I<Int32> = A<Int64, Int32>()
    x.foo(1) - 1
}
