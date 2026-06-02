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
    var hashmap = HashMap<String, Rune>([("dsdsdsd", r'3'), ("key2", r'7')])
    hashmap.addIfAbsent("dsdsdsd", r'9')
    var list_key = ["dsdsdsd", "key2"]
    if (hashmap.contains(all: list_key) != true) {
        return 1
    }
    return 0
}
