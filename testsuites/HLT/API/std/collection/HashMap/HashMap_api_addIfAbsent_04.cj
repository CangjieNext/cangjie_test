/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var map = HashMap<String, Int64>()
    for (i in 0..10000) {
        map.addIfAbsent("key_${i}", Int64(i))
    }
    if (map.size != 10000) {
        return 1
    }
    for (i in 0..10000) {
        if (map.get("key_${i}") != Some(Int64(i))) {
            return 1
        }
    }
    return 0
}
