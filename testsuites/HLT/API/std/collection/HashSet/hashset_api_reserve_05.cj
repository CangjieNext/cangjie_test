/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args| compare %f
// ASSERT: scan success1

import std.collection.*

var str: Array<String> = ["a", "b", "c"]
var r1: HashSet<Int64> = HashSet<Int64>()
var r2: HashSet<String> = HashSet<String>(["0", "2", "1"])
var r3: HashSet<String> = HashSet<String>(str)
var r4: HashSet<String> = HashSet<String>(3)
var r5: HashSet<String> = HashSet<String>(3, {x: Int64 => x.toString()})

main(): Int64 {
    r1.reserve(17)
    r1.reserve(17)
    r2.reserve(17)
    r2.reserve(17)
    r5.reserve(17)
    r5.reserve(17)
    if (r1.capacity != 24) { // 16 * 1.5 > 17 capacity = 24
        return 1
    }
    if (r2.capacity != 20) { // 17 + 3 > 3 * 1.5 capacity = 20
        return 2
    }
    if (r5.capacity != 20) { // 17 + 3 > 3 * 1.5 capacity = 20
        return 3
    }
    print("success1\n")
    return 0
}
