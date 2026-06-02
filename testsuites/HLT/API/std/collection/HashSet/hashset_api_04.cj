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
    var r1: HashSet<String> = HashSet<String>(3, {x: Int64 => x.toString()})
    var r2: HashSet<String> = HashSet<String>(["0", "2", "1"])
    if (r1.size != 3) {
        return 1
    }
    if (r1.contains(all: r2) != true) {
        return 2
    }
    if (r2.contains(all: r1) != true) {
        return 3
    }
    print("success1\n")
    return 0
}
