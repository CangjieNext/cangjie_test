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
    var r2: HashSet<String> = HashSet<String>(["a", "b", "c"])
    var r4: HashSet<String> = HashSet<String>(3)
    r2.reserve(2)
    if (r2.capacity != 5) { // 3 + 2 > 3 * 1.5 capacity = 5
        return 1
    }
    r2.reserve(11)
    if (r2.capacity != 14) { // 3 + 11 > 5 * 1.5 capacity = 14
        return 2
    }
    r2.reserve(1)
    if (r2.capacity != 14) { // 3 + 1 < 14 capacity = 14
        return 3
    }
    r2.reserve(32)
    if (r2.capacity != 35) { // 3 + 32 > 14 * 1.5 capacity = 35
        return 4
    }
    r4.reserve(2)
    if (r4.capacity != 3) { // 0 + 2 < 3 capacity = 3
        return 5
    }
    r4.reserve(11)
    if (r4.capacity != 11) { // 0 + 11 > 3 * 1.5 capacity = 11 
        return 6
    }
    r4.reserve(1)
    if (r4.capacity != 11) { // 0 + 1 < 11 capacity = 11
        return 7
    }
    r4.reserve(32)
    if (r4.capacity != 32) { // 0 + 32 > 11 * 1.5 capacity = 32
        return 8
    }
    print("success1\n")
    return 0
}
