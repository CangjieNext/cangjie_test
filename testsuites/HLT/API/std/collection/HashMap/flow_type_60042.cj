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

import std.collection.*

func x<T>(input: T): T {
    input
}

func y<T>(input: T): T {
    input
}

func test<T>(input: T): T {
    return input |> (x<T> ~> y<T>)
}

func foo<T>(input: T): Int64 {
    test<HashMap<Int64, Int64>>(HashMap<Int64, Int64>([(1, 1)]))
    return 0
}

func bar<T>(input: T): Int64 {
    HashMap<Int64, Int64>([(1, 1)]) |> (x<HashMap<Int64, Int64>> ~> y<HashMap<Int64, Int64>>)
    return 0
}

main(): Int64 {
    return foo(1) + bar(1)
}
