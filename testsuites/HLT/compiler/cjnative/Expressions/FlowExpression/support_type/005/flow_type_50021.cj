/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

func x<T>(input: ArrayList<T>): ArrayList<T> {
    input
}

func y<T>(input: ArrayList<T>): ArrayList<T> {
    input
}

func test<T>(input: T): Int64 {
    ArrayList<T>([input]) |> (x<T> ~> y<T>)
    return 0
}

main(): Int64 {
    return test<Int64>(1)
}
