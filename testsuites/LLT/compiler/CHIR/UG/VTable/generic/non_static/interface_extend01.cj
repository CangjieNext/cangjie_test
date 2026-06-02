// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface III1 {
    func foo(a: Int64): Int64 {
        1
    }
}

interface III2<U> {
    func foo(a: U): Int64
}

class AAA<X, Y> <: III1 {}

extend<T> AAA<T, T> <: III2<Int64> {}

main() {
    return AAA<Int32, Int32>().foo(1) - 1
}
