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
// ASSERT: scan-not fail1

import std.collection.*

main(): Int64 {
    var str: Array<String> = ["a", "b", "c"]
    var r1: HashSet<Int64> = HashSet<Int64>()
    r1.reserve(-9223372036854775808)
    if (r1.capacity != 16) {
        print("fail1\n")
        return 1
    }
    print("success1\n")
    return 0
}
