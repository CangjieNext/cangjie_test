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

class A<T, Z> {
    A(let a: T, var b: Z) {
    }
}

extend<X, Y> A<X, Y> {
    mut prop pa: Y {
        get() {
            b
        }
        set(v) {
            b = v
        }
    }
}

main() {
    var c = A<Int64, Float64>(3, 3.0)
    c.pa = 1.0
    return Int64(c.pa - 1.0)
}
