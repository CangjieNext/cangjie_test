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

class A {
    public var x: Int64

    public operator func -(): Int64 {
        return -10
    }

    public operator func -(input: A): A {
        return A(10)
    }

    public init(x: Int64) {
        this.x = x
    }
}

main(): Int64 {
    var a = A(10)
    var b = A(1)
    a -= b

    return a.x - 10
}
