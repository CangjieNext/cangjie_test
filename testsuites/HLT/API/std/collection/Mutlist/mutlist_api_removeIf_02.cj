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

func case01(x: (String) -> Bool) {
    var a = r1.removeIf(x)
    return r1[1]
}

func foo(x: String): Bool {
    if (x == "e") {
        return true
    } else {
        return false
    }
}

main(): Int64 {
    if (case01(foo) == "c") {
        return 1
    }
    return 0
}
