// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I<T> {
    static func f1(a: T): Unit

    static func f3(a: T): Unit {
        f1(a)
    }
}

interface I1 <: I<Int64> & I<String> {
    static func f1(a: Int64): Unit {
        f1("1")
    }
    static func f1(a: String): Unit {
        f2()
    }

    static func f2(): Unit
}

class C <: I1 {
    static public func f2(): Unit {}
}

main() {
    C.f3(1)
}