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

var hashmap1: HashMap<Int8, String> = HashMap<Int8, String>([(1, "1")])
var hashmap2: HashMap<Int8, String> = HashMap<Int8, String>(2, {x: Int64 => (Int8(x), x.toString())})
var hashmap3: HashMap<Int8, String> = HashMap<Int8, String>()
var hashmap4: HashMap<Int8, String> = HashMap<Int8, String>(0)

main(): Int64 {
    hashmap1.reserve(20)
    hashmap2.reserve(20)
    hashmap3.reserve(20)
    hashmap4.reserve(20)
    if (hashmap1.capacity != 21) {
        return 1
    }
    if (hashmap2.capacity != 22) {
        return 2
    }
    if (hashmap3.capacity != 24) {
        return 3
    }
    if (hashmap4.capacity != 20) {
        return 4
    }
    return 0
}
