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

func case01(x: Int8) {
    var a = hashmap1.get(x)
    return match (a) {
        case Some(x) => x
        case None => "No"
    }
}

main(): Int64 {
    if (hashmap1.size == 2 && case01(0) == "0" && case01(1) == "1") {
        return 0
    }
    return 1
}
