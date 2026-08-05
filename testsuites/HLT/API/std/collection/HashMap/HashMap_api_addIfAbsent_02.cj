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
    map.add("key1", 100)
    let result = map.addIfAbsent("key1", 200)
    match (result) {
        case Some(v) =>
            if (v == 100 && map.get("key1") == Some(100)) {
                return 0
            }
        case None => return 1
    }
    return 1
}
