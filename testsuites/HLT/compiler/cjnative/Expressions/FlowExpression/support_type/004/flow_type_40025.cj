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

func x(input: ArrayList<Int64>): ArrayList<Int64> {
    input
}

func y(input: ArrayList<Int64>): ArrayList<Int64> {
    input
}

main(): Int64 {
    ArrayList<Int64>([1]) |> (x ~> y)
    return 0
}
