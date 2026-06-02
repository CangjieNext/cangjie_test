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
var r1: HashSet<String> = HashSet<String>()
var r2: HashSet<String> = HashSet<String>(["a", "b", "c"])
var r3: HashSet<String> = HashSet<String>(str)
var r4: HashSet<String> = HashSet<String>(3)
var r5: HashSet<String> = HashSet<String>(3, {x: Int64 => x.toString()})

main(): Int64 {
    var r6: HashSet<String> = HashSet<String>(["a", "b", "c"])
    var r7: HashSet<String> = HashSet<String>(["1", "2", "0"])
    if (r1.subsetOf(r6) != true) {
        return 1
    }
    if (r2.subsetOf(r6) != true) {
        return 2
    }
    if (r3.subsetOf(r6) != true) {
        return 3
    }
    if (r4.subsetOf(r6) != true) {
        return 4
    }
    if (r5.subsetOf(r7) != true) {
        return 5
    }
    print("success1\n")
    return 0
}
