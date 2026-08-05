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
    let r1 = map.addIfAbsent("key1", 10)
    let r2 = map.addIfAbsent("key1", 20)
    let r3 = map.addIfAbsent("key1", 30)
    if (r1 is None && r2 == Some(10) && r3 == Some(10) && map.get("key1") == Some(10)) {
        return 0
    }
    return 1
}
