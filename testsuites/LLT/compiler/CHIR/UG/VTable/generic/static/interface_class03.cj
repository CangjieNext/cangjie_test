// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface III1<T> {
    static func foo1(a: T): Int64 {
        0
    }
    static func foo2(): Int64 {
        1
    }
}

interface III2 <: III1<Int32> {
    static func foo1(a: Int32): Int64 {
        2
    }
}

class AAA <: III1<Int64> & III2 {
    public static func foo1(a: Int64): Int64 {
        3
    }
    public static func foo2(): Int64 {
        4
    }
}

main() {
    return AAA.foo2() - 4 + AAA.foo1(Int32(2)) - 2 + AAA.foo1(999) - 3
}
