/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var hashmap = HashMap<String, Float32>()
    var entry = hashmap.entryView("key")
    entry.value = 345.323
    var setResult = entry.value
    entry.value = 43224.543
    if (setResult != 345.323 || hashmap.get("key").getOrThrow() != 43224.543) {
        return 1
    }
    return 0
}
