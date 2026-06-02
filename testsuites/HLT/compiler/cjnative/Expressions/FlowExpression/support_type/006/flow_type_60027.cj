/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 EXCLUDE
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

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
    test<Unit>(())
    return 0
}

func bar<T>(input: T): Int64 {
    () |> (x<Unit> ~> y<Unit>)
    return 0
}

main(): Int64 {
    return foo(1) + bar(1)
}
