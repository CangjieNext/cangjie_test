// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

open class AAA<T> {
    public func foo1(a: T): Int64 {
        1
    }
}

interface III {
    func foo1(a: Int64): Int64
}

class BBB<T> <: AAA<Int64> & III {}

main() {
    return BBB<Int32>().foo1(1) - 1
}
