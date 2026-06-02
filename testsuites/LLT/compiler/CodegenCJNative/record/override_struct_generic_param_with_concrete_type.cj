// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct MyArray<T> {
    var a = 1
    var b = 2
}

interface I<T> {
    func foo(x:MyArray<T>): MyArray<T> {
        return MyArray<T>()
    }
}

class CA <: I<Int64> {
    public func foo(x:MyArray<Int64>): MyArray<Int64> {
        return x
    }
}

main() {
    var a: I<Int64> = CA()
    var b = a.foo(MyArray<Int64>())
    return b.a - 1
}