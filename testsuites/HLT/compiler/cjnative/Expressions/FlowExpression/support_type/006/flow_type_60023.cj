/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

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
    test(1..10)
    return 0
}

func bar<T>(input: T): Int64 {
    1..10 |> (x<T> ~> y<T>)
    return 0
}

main(): Int64 {
    return foo(1) + bar(1)
}
// ASSERT: scan sema_invalid_binary_expr
