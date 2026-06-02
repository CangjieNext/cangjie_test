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

main(): Int64 {
    var str: Array<String> = ["a", "b", "c"]
    var r1: HashSet<String> = HashSet<String>()
    var r2: HashSet<String> = HashSet<String>(["a", "b", "c"])
    var r3: HashSet<String> = HashSet<String>(str)
    var r4: HashSet<String> = HashSet<String>(3)
    var r5: HashSet<String> = HashSet<String>(3, {x: Int64 => x.toString()})
    var list1: Array<String> = []
    var list2: Array<String> = []
    if (r1.contains(all: list1) != true) {
        return 1
    }
    if (r2.contains(all: list1) != true) {
        return 2
    }
    if (r3.contains(all: list1) != true) {
        return 3
    }
    if (r4.contains(all: list1) != true) {
        return 4
    }
    if (r5.contains(all: list2) != true) {
        return 5
    }
    print("success1\n")
    return 0
}
