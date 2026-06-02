// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface A<T> {
    func foo<S, K>(_: S): Unit
}

struct B<T> {}

extend<T> B<T> <: A<T> {
    public func foo<L, N>(_: L) {
        println(3)
    }
}

main() {
    let a = B<Int64>()
    a.foo<Bool, String>(true)
}
/* SCAN
3
*/
