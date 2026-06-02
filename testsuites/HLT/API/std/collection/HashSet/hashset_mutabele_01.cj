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

var str1: Array<String> = ["a", "b"]
var str2: String = "c"
var r1: HashSet<String> = HashSet<String>(str1)

func test(x: HashSet<String>): HashSet<String> {
    x.add(str2)
    return x
}

main(): Int64 {
    test(r1)
    if (r1.size != 3) {
        return 1
    }
    if (r1.contains(str1[0]) != true) {
        return 2
    }
    if (r1.contains(str1[1]) != true) {
        return 3
    }
    if (r1.contains(str2) != true) {
        return 4
    }
    if (r1.capacity != 3) {
        return 5
    }
    print("success1\n")
    return 0
}
