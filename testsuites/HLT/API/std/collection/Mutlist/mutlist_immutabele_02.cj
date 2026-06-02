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

func test(x: ArrayList<String>, y: String): ArrayList<String> {
    x.add(y)
    return x
}

main(): Int64 {
    test(r1, "d")
    test(r1, "e")
    test(r1, "f")
    if (r1.size != 6) {
        return 1
    }
    if (r1[0] != "a") {
        return 2
    }
    if (r1[1] != "b") {
        return 3
    }
    if (r1[2] != "c") {
        return 4
    }
    if (r1[3] != "d") {
        return 5
    }
    if (r1[4] != "e") {
        return 6
    }
    if (r1[5] != "f") {
        return 7
    }
    return 0
}
