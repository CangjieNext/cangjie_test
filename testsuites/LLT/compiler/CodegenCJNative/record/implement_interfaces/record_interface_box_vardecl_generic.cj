// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface cc<T> {
    func g(a!: T): String
}

interface bb<T> {
    func f(a!: T): String
}

struct A<T> <: bb<T> & cc<T> where T <: ToString {
    public func f(a!: T): String {
        a.toString()
    }
    public func g(a!: T): String {
        f(a: a)
    }
}

func f<T>(b: cc<T>, a: T): String {
    b.g(a: a)
}

main() {
    var b: cc<Bool> = A<Bool>()
    var c: bb<Int64> = A<Int64>()
    if (f(b, false) != "false") {
        return 1
    }
    if (b.g(a: false) != "false") {
        return 1
    }
    if (c.f(a: 1000000) != "1000000") {
        return 1
    }
    return 0
}
