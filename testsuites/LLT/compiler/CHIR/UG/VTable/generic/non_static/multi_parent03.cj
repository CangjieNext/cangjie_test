// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface III1<T> {
    func foo(a: T): (T, Unit)
}

interface III2<T> {
    func foo(a: T): (T, Unit)
}

class AAA<T> <: III1<T> & III2<T> {
    public func foo(a: T): (T, Unit) {
        (a, ())
    }
}

main() {
    AAA<Int64>().foo(2)[0] - 2
}
