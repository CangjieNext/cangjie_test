// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface III1<T> {
    func foo1(a: T): T
}

open class AAA<T> <: III1<T> {
    public func foo1(a: T): T {
        a
    }
}

interface III2<T> {
    func foo1(a: T): T {
        a
    }
}

class BBB <: AAA<Int32> & III2<Int64> {}

main() {
    return BBB().foo1(1) - 1
}
