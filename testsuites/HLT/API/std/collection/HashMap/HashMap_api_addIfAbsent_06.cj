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
    let r1 = map.addIfAbsent("", 1)
    let r2 = map.addIfAbsent("", 2)
    if (r1 is None && r2 == Some(1) && map.get("") == Some(1) && map.size == 1) {
        return 0
    }
    return 1
}
