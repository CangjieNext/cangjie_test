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
    public var a: Float32
    public open operator func *(input: A): A {
        return A(input.a * 0.2)
    }
    public init(a: Float32) {
        this.a = a
    }
}

main(): Int64 {
    var x = A(1.0)
    var y = A(5.0)
    x *= y

    if (x.a != Float32(1)) {
        return 1
    }
    return 0
}
