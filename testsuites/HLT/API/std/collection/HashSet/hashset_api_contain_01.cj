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
    var r1: HashSet<Int64> = HashSet<Int64>()
    var r2: HashSet<String> = HashSet<String>(["0", "2", "1"])
    var r3: HashSet<String> = HashSet<String>(str)
    var r4: HashSet<String> = HashSet<String>(3)
    var r5: HashSet<String> = HashSet<String>(3, {x: Int64 => x.toString()})
    if (r1.size != 0) {
        return 1
    }
    if (r2.size != 3) {
        return 2
    }
    if (r2.contains("0") != true) {
        return 3
    }
    if (r2.contains("1") != true) {
        return 4
    }
    if (r2.contains("2") != true) {
        return 5
    }
    if (r3.size != 3) {
        return 6
    }
    if (r3.contains("a") != true) {
        return 7
    }
    if (r3.contains("b") != true) {
        return 8
    }
    if (r3.contains("c") != true) {
        return 9
    }
    if (r4.size != 0) {
        return 10
    }
    if (r5.size != 3) {
        return 11
    }
    if (r5.capacity != 3) {
        return 12
    }
    if (r5.contains("0") != true) {
        return 13
    }
    if (r5.contains("1") != true) {
        return 14
    }
    if (r5.contains("2") != true) {
        return 15
    }
    print("success1\n")
    return 0
}
