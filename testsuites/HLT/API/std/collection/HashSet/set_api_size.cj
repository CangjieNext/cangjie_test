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

var setOne: HashSet<Int64> = HashSet<Int64>([1, 2, 3, 3])
var set2: HashSet<Int64> = HashSet<Int64>()

main(): Int64 {
    if (setOne.size != 3) {
        return 1
    }
    if (set2.size != 0) {
        return 2
    }
    return 0
}
