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

extend Int64 <: Number<Int16> {
    public operator func +(that: Int16) {
        that
    }
}

extend Int16 <: Number<Int32> {
    public operator func +(that: Int32) {
        that
    }
}

extend Int32 <: Number<Int64> {
    public operator func +(that: Int64) {
        that
    }
}

interface Add<T1, T2, T3> where T1 <: Number<T2>, T2 <: Number<T3> {
    static func foos1(a: T1, b: T2, c: T3) {
        return a + b + c
    }

    static func foos2(a: T1, b: T2, c: T3) {
        return foos1(a, b, c)
    }
}

class A<T1, T2, T3> where T1 <: Number<T2>, T2 <: Number<T3> {}

extend<T1, T2, T3> A<T1, T2, T3> <: Add<T1, T2, T3> {}

main() {
    return A<Int16, Int32, Int64>.foos2(1, 2, 3) - 3
}
