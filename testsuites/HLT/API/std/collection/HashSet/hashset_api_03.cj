/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args|compare %f
// ASSERT: scan success1

import std.collection.*

main(): Int64 {
    var r1: HashSet<String> = HashSet<String>(3)
    var r2: HashSet<String> = HashSet<String>(0)
    var r3: HashSet<String> = HashSet<String>(1000)
    if (r1.size != 0) {
        return 1
    }
    if (r1.capacity != 3) {
        return 2
    }
    if (r2.size != 0) {
        return 3
    }
    if (r2.capacity != 0) {
        return 4
    }
    if (r3.size != 0) {
        return 5
    }
    if (r3.capacity != 1000) {
        return 6
    }
    print("success1\n")
    return 0
}
