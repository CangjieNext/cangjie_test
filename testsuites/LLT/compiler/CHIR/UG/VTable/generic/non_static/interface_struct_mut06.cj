// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %output %run_args

interface I1<T> {
    mut func foo(x: T) {
        println(1)
    }
}

struct S1<M> {
    public mut func foo(x: M) {
        println(2)
    }
}

extend<N> S1<N> <: I1<N> {}

main() {
    var x = S1<Bool>()
    x.foo(true)
}
