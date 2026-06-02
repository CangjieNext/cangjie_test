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

open class A {
    public let a: Int64
    public open operator func +(inputB: A): Int64 {
        return 0
    }
    public init(a: Int64) {
        this.a = a
    }
}

class B <: A {
    public operator override func +(inputB: A): Int64 {
        return 0
    }
    public init(a: Int64) {
        super(a)
    }
}

main(): Int64 {
    var a = B(1)
    var b = B(-1)
    return (a + b)
}
