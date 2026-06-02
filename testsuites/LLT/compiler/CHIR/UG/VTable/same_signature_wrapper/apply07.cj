// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %disInst %f -o %n.%suffix
// RUN-EXEC: %run %run_opt %output %run_args

interface I<T> {
    func foo(x: T): T
}

extend Int64 <: I<Int32> {
    public func foo(x: Int32) {
        x
    }
}

main() {
    1.foo(2) - 2
}
