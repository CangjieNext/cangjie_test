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
var r1: HashSet<String> = HashSet<String>(str1)
var r2: HashSet<String> = HashSet<String>(["a", "b"])

main(): Int64 {
    if (r1.size != 2) {
        return 1
    }
    if (r1.contains("a") != true) {
        return 2
    }
    if (r1.contains("b") != true) {
        return 3
    }
    if (r2.size != 2) {
        return 4
    }
    if (r2.contains("a") != true) {
        return 5
    }
    if (r2.contains("b") != true) {
        return 6
    }
    print("success1\n")
    return 0
}
