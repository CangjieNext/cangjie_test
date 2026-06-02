// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

abstract open class AAA<T> {
    protected open func foo1() {
        1
    }
    public func foo2(): Int64
}

class BBB<U> <: AAA<U> {
    protected func foo1() {
        2
    }
    public func foo2() {
        3
    }
}

main() {
    return BBB<Int32>().foo1() + BBB<Int32>().foo2() - 5
}
