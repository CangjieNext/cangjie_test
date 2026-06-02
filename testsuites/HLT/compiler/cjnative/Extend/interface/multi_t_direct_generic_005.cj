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

extend Int64 <: Number<Int64> {}

extend Int64 <: Number<Int32> {
    public operator func +(that: Int32): Int32 {
        Int32(this) + that
    }
}

extend Int64 <: Number<Int16> {
    public operator func +(that: Int16): Int16 {
        Int16(this) + that
    }
}

extend Int16 <: Number<Int16> {}

extend Int16 <: Number<Int32> {
    public operator func +(that: Int32): Int32 {
        Int32(this) + that
    }
}

extend Int16 <: Number<Int64> {
    public operator func +(that: Int64): Int64 {
        Int64(this) + that
    }
}

extend Int32 <: Number<Int32> {}

extend Int32 <: Number<Int16> {
    public operator func +(that: Int16): Int16 {
        Int16(this) + that
    }
}

extend Int32 <: Number<Int64> {
    public operator func +(that: Int64): Int64 {
        Int64(this) + that
    }
}

class A<T1, T2, T3> {}

interface I<T1, T3, T2> {
    static func foo<T1, T2, T3>(a: T1, b: T2, c: T3) where T1 <: Number<T2>, T2 <: Number<T3> {
        return a + b + c
    }

    static func foo<T1, T2>(a: T1, b: T2) where T1 <: Number<T2> {
        return a + b
    }
}

extend<T1, T3, T2> A<T1, T3, T2> <: I<T1, T3, T2> {}

main() {
    var a = A<Int16, Int32, Int64>.foo(1, 2, 3)
    var b = A<Int16, Int32, Int64>.foo<Int32, Int32, Int64>(1, 2, 3)
    var c = A<Int16, Int32, Int64>.foo<Int32, Int32>(1, 1)
    return a + b + c - 14
}
