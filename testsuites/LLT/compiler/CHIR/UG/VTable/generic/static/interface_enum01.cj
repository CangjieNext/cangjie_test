// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface III<M, N> {
    static func foo1(a: M): Int64 {
        0
    }
}

enum AAA<T> <: III<Int64, T> {
    RED | GREEN

    public static func foo1(a: Int64): Int64 {
        1
    }
}

main() {
    return AAA<Int32>.foo1(1) - 1
}
