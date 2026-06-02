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

var hashmap1: HashMap<Int8, String> = HashMap<Int8, String>([(1, "a"), (3, "b")])

main(): Int64 {
    hashmap1[1] = "ok"
    if (hashmap1.size == 2 && hashmap1[1] == "ok" && hashmap1[3] == "b") {
        return 0
    }
    return 1
}
