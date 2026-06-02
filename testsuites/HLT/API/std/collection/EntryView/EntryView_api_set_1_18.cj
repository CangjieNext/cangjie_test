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
    var hashmap = HashMap<String, HashMap<Rune, HashMap<Int8, UInt16>>>()
    var ele1 = HashMap<Rune, HashMap<Int8, UInt16>>([(r'a', HashMap<Int8, UInt16>([(4, 98), (-128, 128)]))])
    var entry = hashmap.entryView("key")
    entry.value = ele1
    var ele2 = HashMap<Rune, HashMap<Int8, UInt16>>([(r'b', HashMap<Int8, UInt16>([(4, 98)]))])
    var setResult = entry.value.getOrThrow()
    entry.value = ele2
    if (setResult.get(r'a').getOrThrow().size != ele1.get(r'a').getOrThrow().size) {
        return 1
    }
    return 0
}
