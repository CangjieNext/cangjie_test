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
    var hashmap = HashMap<String, Array<HashMap<String, Int32>>>()
    var ele1: Array<HashMap<String, Int32>> = [HashMap<String, Int32>([("key1", 34)]),
        HashMap<String, Int32>([("key1", 34)])]
    var entry = hashmap.entryView("key")
    entry.value = ele1
    var ele2: Array<HashMap<String, Int32>> = [HashMap<String, Int32>([("key1", 65)])]
    var setResult = entry.value.getOrThrow()
    entry.value = ele2
    if (setResult[0].get("key1") != ele1[0].get("key1") || setResult[1].get("key1") != ele1[1].get("key1")) {
        return 1
    }
    return 0
}
