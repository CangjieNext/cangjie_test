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
    var r1: HashSet<String> = HashSet<String>()
    var r4: HashSet<String> = HashSet<String>(3)
    r1.clear()
    r4.clear()
    var it1 = r1.iterator()
    var it4 = r4.iterator()
    if (r1.size != 0) {
        return 3
    }
    if (r4.size != 0) {
        return 4
    }
    print("success1\n")
    return 0
}
