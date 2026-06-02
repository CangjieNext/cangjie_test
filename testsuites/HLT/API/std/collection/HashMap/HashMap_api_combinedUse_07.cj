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

var hashmap = HashMap<String, Bool>([("dsdsdsd", true)])

main(): Int64 {
    var size_before = hashmap.size
    var entry = hashmap.addIfAbsent("dsdsdsd", false)
    hashmap.removeIf(test01)
    if (hashmap.size != size_before) {
        return 1
    }
    hashmap.removeIf(test02)
    if (hashmap.size != size_before - 1) {
        return 2
    }
    return 0
}

func test01(x: String, y: Bool): Bool {
    if (x == "dsdsdsd" && y == false) {
        return true
    }
    return false
}

func test02(x: String, y: Bool): Bool {
    if (x == "dsdsdsd" && y == true) {
        return true
    }
    return false
}
