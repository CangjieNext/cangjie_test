// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I<T, U, V, W> {
    static func foo<T>() {
        1
    }
}

class B<T> <: I<Int32, T, Int64, T> {
    public static func me<T, U>() {
        let a = foo<T>
        a()
    }
}

class A<T, U> {}

extend<T, U> A<T, U> <: I<Rune, T, U, Int64> {
    public static func me() {
        let a = foo<Rune>
        a()
    }
}

main(): Int64 {
    let testb = B<Int32>.me<Int64, Rune>()
    let testa = A<Int32, Int64>.me()
    testb + testa - 2
}
