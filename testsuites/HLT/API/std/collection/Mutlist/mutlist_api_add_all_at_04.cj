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

main(): Int64 {
    var str: Array<String> = ["a", "b", "c"]
    var r1: ArrayList<String> = ArrayList<String>(str)
    var r2: ArrayList<String> = ArrayList<String>([])
    r1.add(all: r2, at: Int64(2))
    if (r1[0] != "a") {
        return 1
    }
    if (r1[1] != "b") {
        return 2
    }
    if (r1[2] != "c") {
        return 3
    }
    return 0
}
