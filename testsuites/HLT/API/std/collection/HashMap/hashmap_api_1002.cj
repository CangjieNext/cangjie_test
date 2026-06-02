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

var hashmap1: HashMap<Int8, String> = HashMap<Int8, String>(2, {x: Int64 => (Int8(x), x.toString())})
var hashmap2: HashMap<Int8, String> = HashMap<Int8, String>([(0, "0"), (3, "1")])

main(): Int64 {
    hashmap1.add(all: hashmap2)
    if (hashmap1.size == 3 && hashmap1[0] == "0" && hashmap1[1] == "1" && hashmap1[3] == "1") {
        return 0
    }
    return 1
}
