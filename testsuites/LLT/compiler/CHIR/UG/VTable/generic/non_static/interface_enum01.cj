// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface III<M, N> {
    func foo1(a: M): Int64 {
        0
    }
    func foo2(): Int64 {
        1
    }
    func foo3(): Int64
}

enum AAA<T> <: III<Int64, T> {
    RED | GREEN

    public func foo1(a: Int64): Int64 {
        2
    }
    public func foo3() {
        3
    }
}

main() {
    return RED<Int32>.foo1(1) - 2 + RED<Int32>.foo2() - 1 + GREEN<Int32>.foo3() - 3
}
