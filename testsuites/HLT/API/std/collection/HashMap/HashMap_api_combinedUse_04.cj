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
    var hashmap = HashMap<String, String>([("dsdsdsd", "6666")])
    var size_before = hashmap.size
    hashmap.addIfAbsent("dsdsdsd", "8888")
    hashmap.addIfAbsent("key3", "9999")
    if (hashmap.get("dsdsdsd") != "6666" || hashmap.get("key3") != "9999" || hashmap.size != size_before + 1) {
        return 1
    }
    return 0
}
