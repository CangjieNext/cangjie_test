// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

abstract open class AAA<T> {
    protected static func foo1() {
        1
    }
}

class BBB<U> <: AAA<U> {
    protected static func foo1() {
        2
    }
    public static func foo2() {
        3
    }
}

main() {
    return BBB<Int32>.foo1() + BBB<Int32>.foo2() - 5
}
