/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

var r1: ArrayList<String> = ArrayList<String>(3)
var r2: ArrayList<String> = ArrayList<String>(["1", "2", "3", "4", "5"])

main(): Int64 {
    r1.add(all: r2)
    if (r1[0] != "1") {
        return 1
    }
    if (r1[1] != "2") {
        return 2
    }
    if (r1[2] != "3") {
        return 3
    }
    if (r1[3] != "4") {
        return 4
    }
    if (r1[4] != "5") {
        return 5
    }
    if (r1.size != 5) {
        return 6
    }
    return 0
}
