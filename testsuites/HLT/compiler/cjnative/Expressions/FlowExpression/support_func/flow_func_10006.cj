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
    public func a(input: Int64): Int64 {
        input
    }

    public func b(input: Int64): Int64 {
        input
    }

    public func c(input: (Int64) -> Int64): Int64 {
        input(1)
    }

    public func test() {
        1 |> a
        a ~> b
        1 |> (a ~> b)
        return (a ~> b |> c) - 1
    }
}

main(): Int64 {
    var x = A()
    1 |> x.a
    x.a ~> x.b
    1 |> (x.a ~> x.b)
    x.a ~> x.b |> x.c
    return (x.a ~> x.b |> x.c) - 1 + x.test()
}
