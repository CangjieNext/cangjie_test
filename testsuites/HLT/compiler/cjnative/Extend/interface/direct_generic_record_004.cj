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

struct A<T> {
    A(var a!: Int64 = 1) {
    }
}

extend<T> A<T> <: I<T> {
    public mut prop pa: Int64 {
        get() {
            a
        }
        set(b) {
            a = b
        }
    }
}

interface I<T> {
    mut prop pa: Int64
}

main() {
    var c = A<Int64>()
    if (c.pa - 1 == 0) {
        c.pa = 3
    }
    return c.pa - 3
}
