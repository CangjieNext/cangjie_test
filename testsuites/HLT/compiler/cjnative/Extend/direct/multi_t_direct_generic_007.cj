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

interface I<T> {
    static func default(): T
}

extend Int64 <: I<Int64> {
    public static func default(): Int64 {
        -64
    }
}

extend Int32 <: I<Int32> {
    public static func default(): Int32 {
        -32
    }
}

class A<T, T1> where T <: I<T>, T1 <: I<T1> {
    static var a: Int64 = Int64.default()
    static let b: Int32 = Int32.default()
}

extend<X, Y> A<X, Y> {
    mut static prop pa: Int64 {
        get() {
            a
        }
        set(v) {
            a = v
        }
    }

    static prop pb: Int32 {
        get() {
            b
        }
    }
}

main() {
    var a = A<Int64, Int32>.pa
    A<Int64, Int32>.pa = 2
    return a + A<Int64, Int32>.pa + Int64(A<Int64, Int32>.pb) + 94
}
