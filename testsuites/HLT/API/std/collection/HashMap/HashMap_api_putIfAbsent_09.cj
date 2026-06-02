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
    var hashmap = HashMap<String, Int64>([("dsdsdsd", 3)])
    var size_before = hashmap.size
    var entry = hashmap.addIfAbsent("dsdsdsd", 8)
    if (hashmap.get("dsdsdsd") != 3 || hashmap.size != size_before) {
        return 1
    }
    return 0
}
