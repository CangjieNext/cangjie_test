/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

var hashmap1: HashMap<Int8, String> = HashMap<Int8, String>(3, {x: Int64 => (Int8(x), x.toString())})

func case01(x: Int8, y: String): Bool {
    if (x == 0 && y == "1") {
        return true
    }
    return false
}

main(): Int64 {
    hashmap1.removeIf(case01)
    if (hashmap1.size == 3 && hashmap1[0] == "0" && hashmap1[1] == "1" && hashmap1[2] == "2") {
        return 0
    }
    return 1
}
