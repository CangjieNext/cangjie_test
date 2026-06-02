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
    var hashmap = HashMap<String, Array<Int8>>()
    var arr1: Array<Int8> = [1, 2, 3]
    var entry = hashmap.entryView("key")
    entry.value = arr1
    var arr2: Array<Int8> = [4, 5, 6]
    var setResult = entry.value
    entry.value = arr2
    if (setResult != arr1 || hashmap.get("key").getOrThrow() != arr2) {
        return 1
    }
    return 0
}
