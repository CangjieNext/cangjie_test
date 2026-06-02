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

var value1 = HashMap<String, Int64>()
var value2 = HashMap<String, Int64>([("d", 8)])

main(): Int64 {
    var hashmap4: HashMap<String, HashMap<String, Int64>> = HashMap<String, HashMap<String, Int64>>([("a", value1)])
    var entryView = hashmap4.entryView("b")
    if (entryView.value.isNone()) {
        entryView.value = value2
    }
    var ele8 = entryView.value.getOrThrow() // absent, put succeed, return value2
    var exp4 = "[(a, []), (b, [(d, 8)])]"
    if (ele8.toString() != "[(d, 8)]") {
        return 1
    }
    if (hashmap4.toString() != exp4) {
        return 3
    }
    return 0
}
