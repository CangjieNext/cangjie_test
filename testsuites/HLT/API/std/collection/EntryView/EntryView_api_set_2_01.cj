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
    var hashmap = HashMap<String, Rune>()
    var entry = hashmap.entryView("key")
    entry.value = r's'
    var size_before = hashmap.size
    var setResult = entry.value
    entry.value = r'a'
    if (hashmap.get("key") != r'a' || hashmap.size != size_before) {
        return 1
    }
    return 0
}
