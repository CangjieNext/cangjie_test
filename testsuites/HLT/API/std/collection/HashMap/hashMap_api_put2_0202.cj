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

main(): Int64 {
    var hashmap2: HashMap<Float64, Int64> = HashMap<Float64, Int64>([(3.0, 3), (4.0, 4)])
    var entryView = hashmap2.entryView(5.0)
    entryView.value = -1
    var ele4 = entryView.value.getOrThrow() // absent, put succeed, return -1
    var exp2 = "[(${Float64(3)}, 3), (${Float64(4)}, 4), (${Float64(5)}, -1)]"
    if (ele4 != -1) {
        return 1
    }
    if (hashmap2.toString() != exp2) {
        return 3
    }
    return 0
}
