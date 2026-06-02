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

main(): Int64 {
    var list1: Array<String> = ["d", "e"]
    var list2: Array<String> = ["3", "4"]
    r2.remove(all: list1)
    r3.remove(all: list1)
    r5.remove(all: list2)
    if (r2.contains("d") == true) {
        return 1
    }
    if (r2.contains("e") == true) {
        return 2
    }
    if (r2.size != 3) {
        return 3
    }
    if (r3.contains("d") == true) {
        return 4
    }
    if (r3.contains("e") == true) {
        return 5
    }
    if (r3.size != 3) {
        return 6
    }
    if (r5.contains("4") == true) {
        return 7
    }
    if (r5.contains("3") == true) {
        return 8
    }
    if (r5.size != 3) {
        return 9
    }
    print("success1\n")
    return 0
}
