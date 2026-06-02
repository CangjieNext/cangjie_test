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
    A(var a!: Int64 = 1) {
    }
}

interface I<X, Y, Z> {
    mut prop pa: Int64
}

extend<X, Y, Z> A<X, Y, Z> <: I<X, Y, Z> {
    public mut prop pa: Int64 {
        get() {
            a
        }
        set(b) {
            a = b
        }
    }
}

main() {
    var c = A<Int64, String, C>()
    if (c.pa - 1 == 0) {
        c.pa = 3
    }
    return c.pa - 3
}

class C {}
