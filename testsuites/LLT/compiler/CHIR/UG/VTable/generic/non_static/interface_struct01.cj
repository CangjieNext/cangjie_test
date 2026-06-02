// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface III<U> {
    func foo1(a: U): Int64 {
        0
    }
    func foo2(): Int64 {
        1
    }
    func foo3(a: (U, Int32)): Int64
}

struct AAA<T> <: III<T> {
    public func foo1(a: T): Int64 {
        2
    }
    public func foo3(a: (T, Int32)): Int64 {
        3
    }
}

main() {
    var x: III<Int32> = AAA<Int32>()
    return AAA<Int64>().foo1(1) - 2 + x.foo2() - 1 + x.foo3((1, 2)) - 3
}
