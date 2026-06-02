/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// struct
struct A {
    public var a: Int64
    public static var b: Int64 = 5
    public init(x: Int64) {
        a = x
        b = x
    }
    public operator func [](index: Int64): Int64 {
        if (index > 1) {
            3
        } else {
            this.a
        }
    }
    public operator func [](index: Int64, value!: Int64): Unit {
        A.b = value
    }
    public operator func +(index: Int64): Unit {
        A.b = A.b + index
    }
}

main(): Int64 {
    var a = A(2)
    a[2] = 4
    // A(2)[2] = 4
    a + 2
    if (a[1] == 2 && A.b == 6) {
        return 0
    }
    return 1
}
