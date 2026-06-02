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

interface Number {
    operator func /(right: Number): Number

    func as_i64(): Int64
}

extend Int64 <: Number {
    public operator func /(right: Number): Number {
        this / right.as_i64()
    }

    public func as_i64(): Int64 {
        this
    }
}

main(): Int64 {
    var a: Number = 10
    var b: Number = 100 / 10

    a /= b

    var c = a.as_i64() - 1

    return c
}
