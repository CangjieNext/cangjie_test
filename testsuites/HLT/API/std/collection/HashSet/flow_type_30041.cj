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

func f<T>(input: T): Int64 {
    0
}

func test<T>(input: T): Int64 {
    return HashSet<Int64>([1]) |> f
}

main(): Int64 {
    return test<Int64>(1)
}
