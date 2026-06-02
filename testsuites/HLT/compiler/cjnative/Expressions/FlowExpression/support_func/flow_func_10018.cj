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

struct A {
    public var a: (Int64) -> Int64 = {input: Int64 => input}

    public var b: (Int64) -> Int64 = {input: Int64 => input}

    public var c: ((Int64) -> Int64) -> Int64 = {input: (Int64) -> Int64 => input(1)}

    public init() {}
}

main(): Int64 {
    var i = A()
    1 |> i.a
    i.a ~> i.b
    1 |> (i.a ~> i.b)
    return (i.a ~> i.b |> i.c) - 1
}
