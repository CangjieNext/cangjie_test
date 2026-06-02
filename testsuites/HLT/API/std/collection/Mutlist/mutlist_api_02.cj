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
var m = r2[2]

func case01() {
    var a = r1.size
    return a
}

func case02() {
    var a = r2.size
    return a
}

main(): Int64 {
    if (case01() != 3) {
        return 1
    }
    if (case02() != 3) {
        return 2
    }

    return 0
}
