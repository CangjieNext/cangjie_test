// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface III1<U> {
    func foo1(a: Int32): Int64
}

interface III2<T> {
    func foo1(a: T): Int64 {
        1
    }
}

class AAA <: III1<Unit> & III2<Int32> {}

main() {
    return AAA().foo1(Int32(1)) - 1
}
