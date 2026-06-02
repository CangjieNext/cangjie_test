/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args|compare %f
// ASSERT: scan success1

import std.collection.*

var str: Array<String> = ["a", "b", "c"]
var r2: HashSet<String> = HashSet<String>(["a", "b", "c"])
var r3: HashSet<String> = HashSet<String>(str)
var r5: HashSet<String> = HashSet<String>(3, {x: Int64 => x.toString()})

func case01(y: String): Bool {
    if (y == "0" || y == "a") {
        return true
    }
    return false
}

main(): Int64 {
    r2.removeIf(case01)
    r3.removeIf(case01)
    r5.removeIf(case01)
    if (r2.contains("a") == true) {
        return 1
    }
    if (r2.size != 2) {
        return 2
    }
    if (r3.contains("a") == true) {
        return 3
    }
    if (r3.size != 2) {
        return 4
    }
    if (r5.contains("0") == true) {
        return 5
    }
    if (r5.size != 2) {
        return 6
    }
    print("success1\n")
    return 0
}
