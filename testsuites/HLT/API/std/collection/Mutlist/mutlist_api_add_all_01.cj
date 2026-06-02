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

var str: Array<String> = ["a", "b", "c"]
var r1: ArrayList<String> = ArrayList<String>(str)
var r2: ArrayList<String> = ArrayList<String>(["a", "b", "c"])

main(): Int64 {
    r1.add(all: r2)
    if (r1[3] != r2[0]) {
        return 1
    }
    if (r1[4] != r2[1]) {
        return 2
    }
    if (r1[5] != r2[2]) {
        return 3
    }
    if (r1.size != 6) {
        return 4
    }
    return 0
}
