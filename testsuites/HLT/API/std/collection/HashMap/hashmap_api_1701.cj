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

var hashmap2: HashMap<Int8, String> = HashMap<Int8, String>(2, {x: Int64 => (Int8(x), x.toString())})

main(): Int64 {
    var hashmap1: HashMap<Int8, String> = hashmap2.clone()
    var hashmap3: HashMap<Int8, String> = hashmap1.clone()
    var hashmap4: HashMap<Int8, String> = hashmap3.clone()
    var hashmap5: HashMap<Int8, String> = hashmap4.clone()
    if (hashmap5.size == 2 && hashmap5[0] == "0" && hashmap5[1] == "1") {
        return 0
    }
    return 1
}
