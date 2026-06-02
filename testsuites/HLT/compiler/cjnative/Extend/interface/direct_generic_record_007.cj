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
        1
    }
}

struct A<T> where T <: I<T> {
    static var a: Int64 = Int64.default()
}

extend<T> A<T> <: II<T> {
    public mut static prop pa: Int64 {
        get() {
            a
        }
        set(v) {
            a = v
        }
    }
}

interface II<T> {
    mut static prop pa: Int64
}

main() {
    var a = A<Int64>.pa
    A<Int64>.pa = 2
    return a + A<Int64>.pa - 3
}
