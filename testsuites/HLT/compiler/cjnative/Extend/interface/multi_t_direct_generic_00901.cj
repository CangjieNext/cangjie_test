/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface Number<T> {
    operator func +(that: T): T
}

struct A<T1, T2, T3> {}

interface I<T1, T2, T3> where T1 <: Number<T2>, T2 <: Number<T3> {
    static func foos1(a: T1, b: T2, c: T3) {
        return a + b + c
    }
}

extend<T1, T2, T3> A<T1, T2, T3> <: I<T1, T2, T3> where T1 <: Number<T2>, T2 <: Number<T3> {}

interface III<T1, T2, T3> where T1 <: Number<T2>, T2 <: Number<T3> {}

extend<T1, T2, T3> A<T1, T2, T3> <: III<T1, T2, T3> where T1 <: Number<T2>, T2 <: Number<T3> {
    static func foos<X, Y, Z>(a: T1, b: T2, c: T3) {
        return foos1(a, b, c)
    }
}

main() {
    return 0
}
