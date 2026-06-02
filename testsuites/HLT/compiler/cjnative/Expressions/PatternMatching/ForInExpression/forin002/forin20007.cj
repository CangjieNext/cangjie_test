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

import std.collection.*

main() {
    var arr_d2 = ArrayList<ArrayList<Int64>>()
    for (arr_d1 in arr_d2) {
        for (ele in arr_d1) {
            ele |> println
            throw Exception("should not in this branch")
        }
    }
    arr_d2 = ArrayList<ArrayList<Int64>>(10, {i => ArrayList<Int64>([0, 1, 2])})
    var n = 0
    for (arr_d1 in arr_d2) {
        for (ele in arr_d1) {
            ele
            n++
        }
    }
    if (n == 30) {
        0
    } else {
        1
    }
}
