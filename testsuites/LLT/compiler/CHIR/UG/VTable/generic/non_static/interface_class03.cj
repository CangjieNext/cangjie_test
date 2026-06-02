// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface III1<T> {
    func foo1(a: T): Int64 {
        0
    }
    func foo2(): Int64 {
        1
    }
}

interface III2 <: III1<Int32> {
    func foo1(a: Int32): Int64 {
        2
    }
}

class AAA <: III1<Int64> & III2 {
    public func foo1(a: Int64): Int64 {
        3
    }
    public func foo2(): Int64 {
        4
    }
}

main() {
    return AAA().foo1(999) - 3 + AAA().foo2() - 4
}
