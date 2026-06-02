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

interface B {
    static func a(input: Int64): Int64 {
        input
    }

    static func b(input: Int64): Int64 {
        input
    }

    static func c(input: (Int64) -> Int64): Int64 {
        input(1)
    }
}

class A <: B {}

main(): Int64 {
    1 |> A.a
    A.a ~> A.b
    1 |> (A.a ~> A.b)
    return (A.a ~> A.b |> A.c) - 1
}
