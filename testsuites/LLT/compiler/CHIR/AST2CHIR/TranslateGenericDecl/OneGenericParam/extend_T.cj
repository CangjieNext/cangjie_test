// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I {
    func foo(): Unit
}

class A<T> {
    var a = 1
}

extend<T> A<T> <: I {
    public func foo() {
        a++
    }
}

main() {
    var x = A<Int8>()
    x.foo()
    var y = A<Int8>()
    y.foo()
    return x.a - y.a
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
