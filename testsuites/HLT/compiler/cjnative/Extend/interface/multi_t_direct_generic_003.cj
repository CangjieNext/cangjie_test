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

class A<X, Y, Z> {
    static var a: Int64 = 1
}

interface I<X, Y, Z> {
    mut static prop pa: Int64
}

extend<O, P, Q> A<O, P, Q> <: I<O, P, Q> {
    public mut static prop pa: Int64 {
        get() {
            a
        }
        set(v) {
            a = v
        }
    }
}

main() {
    A<Int64, Int32, A<Int64, Int32, Int16>>.pa = 3
    return A<Int64, Int32, A<Int64, Int32, Int16>>.pa - 3
}
