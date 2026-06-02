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

class EEE <: AAA<Int32> {
    public func foo2() {
        4
    }
}

class CCC <: BBB<Int8> {}

open class BBB<U> <: AAA<Int32> {
    protected func foo1() {
        2
    }
    public func foo2() {
        3
    }
}

class DDD <: BBB<Int8> {}

main() {
    return EEE().foo1() - 1 + EEE().foo2() - 4 + CCC().foo1() - 2 + BBB<Int32>().foo2() - 3
}
