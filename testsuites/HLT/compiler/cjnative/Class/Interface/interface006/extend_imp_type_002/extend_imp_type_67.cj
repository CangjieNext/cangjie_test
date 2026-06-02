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

type int = Int64

type TI = I

extend int <: TI {}

interface I {
    operator func [](a: Int64): Int64 {
        a
    }
}

class A {
    public var a: (Int64, Int8)
    public init(a: (Int64, Int8)) {
        this.a = a
    }
    public operator func +(right: A): String {
        return (this.a[0] + right.a[0] + Int64(2)[3]).toString() + (this
            .a[1] + right
            .a[1] + Int8(Int64(2)[1]))
            .toString()
    }
}

main(): Int64 {
    var a: String = A((1, Int8(2))) + A((3, Int8(4)))
    if (a == "77") {
        return 0
    } else {
        return 1
    }
}
