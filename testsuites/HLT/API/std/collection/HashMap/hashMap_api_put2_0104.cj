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
var value2 = HashMap<String, Int64>()

main(): Int64 {
    var hashmap4: HashMap<String, HashMap<String, Int64>> = HashMap<String, HashMap<String, Int64>>([("a", value1)])
    var entryView = hashmap4.entryView("a")
    if (entryView.value.isNone()) {
        entryView.value = value2
    }
    var ele12 = entryView.value.getOrThrow().toString() // not absent, put failed, return value1
    var ele10 = entryView.value.getOrThrow().toString()
    entryView.value = value2 // set value2, return old value, value2
    var exp4 = "[(a, [])]"
    if (ele12 != "[]") {
        println(ele12)
        return 1
    }
    if (ele10.toString() != "[]") {
        return 2
    }
    if (hashmap4.toString() != exp4) {
        return 3
    }
    return 0
}
