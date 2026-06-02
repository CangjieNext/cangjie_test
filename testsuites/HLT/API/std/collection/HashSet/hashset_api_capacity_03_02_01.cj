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
    r2.reserve(14)
    r3.reserve(14)
    r5.reserve(14)
    if (r2.capacity != 17) { // 3 + 14 > 3 * 1.5 capacity = 17
        println("${r2.capacity}")
        return 1
    }
    if (r3.capacity != 17) { // 3 + 14 > 3 * 1.5 capacity = 17
        return 2
    }
    if (r5.capacity != 17) { // 3 + 14 > 3 * 1.5 capacity = 17
        return 3
    }
    print("success1\n")
    return 0
}
