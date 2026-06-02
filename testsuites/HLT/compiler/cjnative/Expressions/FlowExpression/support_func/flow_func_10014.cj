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

interface A {
    func a(input: Int64): Int64

    func b(input: Int64): Int64

    func c(input: (Int64) -> Int64): Int64
}

class B <: A {
    public func a(input: Int64): Int64 {
        input
    }
    public func b(input: Int64): Int64 {
        input
    }
    public func c(input: (Int64) -> Int64): Int64 {
        input(1)
    }
}

main(): Int64 {
    var i: A = B()
    1 |> i.a
    i.a ~> i.b
    1 |> (i.a ~> i.b)
    return (i.a ~> i.b |> i.c) - 1
}
