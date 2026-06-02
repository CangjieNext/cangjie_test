/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*

var str: Array<String> = ["a", "b", "c"]
var r1: HashSet<String> = HashSet<String>()
var r2: HashSet<String> = HashSet<String>(["a", "b", "c"])
var r3: HashSet<String> = HashSet<String>(str)
var r4: HashSet<String> = HashSet<String>(3)
var r5: HashSet<String> = HashSet<String>(3, {x: Int64 => x.toString()})

main(): Int64 {
    var list1 = HashSet<String>(["d"])
    var list2 = HashSet<String>(["4"])
    r1.retain(all: list1)
    r2.retain(all: list1)
    r3.retain(all: list1)
    r4.retain(all: list1)
    r5.retain(all: list2)
    if (r1.size != 0) {
        return 1
    }
    if (r2.contains("d") == true) {
        return 2
    }
    if (r2.contains("a") == true) {
        return 3
    }
    if (r2.contains("b") == true) {
        return 4
    }
    if (r2.contains("c") == true) {
        return 5
    }
    if (r2.size != 0) {
        return 6
    }
    if (r3.contains("d") == true) {
        return 7
    }
    if (r3.contains("a") == true) {
        return 8
    }
    if (r3.contains("b") == true) {
        return 9
    }
    if (r3.contains("c") == true) {
        return 10
    }
    if (r3.size != 0) {
        return 11
    }
    if (r4.size != 0) {
        return 12
    }
    if (r5.contains("4") == true) {
        return 13
    }
    if (r5.contains("0") == true) {
        return 14
    }
    if (r5.contains("1") == true) {
        return 15
    }
    if (r5.contains("2") == true) {
        return 16
    }
    if (r5.size != 0) {
        return 17
    }
    print("success1\n")
    return 0
}
