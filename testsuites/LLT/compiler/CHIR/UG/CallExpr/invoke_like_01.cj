// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I<T> {
    func foo(x: T): T {
        x
    }
}

class A <: I<Int64> {}

class B <: I<Int64> {}

main() {
    A().foo(1) + B().foo(2) - 3
}
