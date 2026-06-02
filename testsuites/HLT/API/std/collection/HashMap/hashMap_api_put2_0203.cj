/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var hashmap3: HashMap<Rune, Bool> = HashMap<Rune, Bool>([(r'A', true), (r'V', true)])
    var entryView = hashmap3.entryView(r'G')
    entryView.value = true
    var ele6 = entryView.value.getOrThrow() // absent, put succeed, return true
    var exp3 = "[(A, true), (V, true), (G, true)]"
    if (ele6 != true) {
        return 1
    }
    if (hashmap3.toString() != exp3) {
        return 3
    }
    return 0
}
