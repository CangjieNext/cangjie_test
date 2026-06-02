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
    public var a: Int8

    public init(a: Int8) {
        this.a = a
    }

    public open operator func /(input: A): A {
        return A(this.a / input.a / 2)
    }
}

main(): Int64 {
    var x = A(100)
    var y = A(5)
    x /= y

    if (x.a != Int8(10)) {
        return 1
    }
    return 0
}
