/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var hashmap1: HashMap<String, Int64> = HashMap<String, Int64>([("a", 3), ("c", 4)])
    var entryView = hashmap1.entryView("d")
    entryView.value = -1
    var ele2 = entryView.value.getOrThrow() // absent, put succeed, return -1
    var exp1 = "[(a, 3), (c, 4), (d, -1)]"

    if (ele2 != -1) {
        return 1
    }
    if (hashmap1.toString() != exp1) {
        return 3
    }
    return 0
}
