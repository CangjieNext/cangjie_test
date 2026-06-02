// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface cc<T> {
    static func g(a!: T): String
}

interface bb<T> {
    func f(a!: T): String
}

struct A<T> <: bb<T> & cc<T> where T <: ToString {
    public func f(a!: T): String {
        a.toString()
    }
    public static func g(a!: T): String {
        a.toString()
    }
}

main() {
    var c: bb<Int64> = A<Int64>()

    if (A<Bool>.g(a: false) == "false" && c.f(a: 1000000) == "1000000") {
        return 0
    }
    return 1
}
