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
    var r2: HashSet<String> = HashSet<String>(["a", "b", "c"])
    var r3: HashSet<String> = HashSet<String>(str)
    var r5: HashSet<String> = HashSet<String>(3, {x: Int64 => x.toString()})
    var r21 = r2.clone()
    var r31 = r3.clone()
    var r51 = r5.clone()
    if (r21.contains(all: str) != true) {
        return 1
    }
    if (r21.size != 3) {
        return 2
    }
    if (r21.capacity != 3) {
        return 3
    }
    if (r31.contains(all: str) != true) {
        return 4
    }
    if (r31.size != 3) {
        return 5
    }
    if (r31.capacity != 3) {
        return 6
    }
    if (r51.contains(all: ["0", "1", "2"]) != true) {
        return 7
    }
    if (r51.size != 3) {
        return 8
    }
    if (r51.capacity != 3) {
        return 9
    }
    print("success1\n")
    return 0
}
