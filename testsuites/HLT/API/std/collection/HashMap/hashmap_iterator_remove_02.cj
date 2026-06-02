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

var map1: HashMap<String, Int64> = HashMap<String, Int64>([("a", 8), ("b", 19)])

main(): Int64 {
    var its = map1.iterator()
    var it1 = its.next()
    var re = its.remove()
    if (map1.size != 1 || it1.getOrThrow() != re.getOrThrow()) {
        return 1
    }
    return 0
}
