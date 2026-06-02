// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A<T> {}

interface I<T, U, V, W> {
    static func foo<T2, T>() {
        1
    }
}

interface I2<T, U, V, X, W> <: I<Rune, U, V, W> {}

class B<T> <: I2<Int32, T, Int64, Rune, T> {
    public static func me<T2, U2>() {
        let a = foo<T, T2>
        a()
    }
}

main(): Int64 {
    let testb = B<Int32>.me<Int64, Rune>()
    testb - 1
}
