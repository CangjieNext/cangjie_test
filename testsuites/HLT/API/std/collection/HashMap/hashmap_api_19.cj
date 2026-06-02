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

var hashmap1: HashMap<Int8, String> = HashMap<Int8, String>([(1, "a"), (3, "b")])

main(): Int64 {
    var list1 = hashmap1.values()
    var exp_values: Array<String> = ["a", "b"]
    if (list1.size == 2) {
        var it = list1.iterator()
        for (i in 0..list1.size) {
            var act_value = it.next().getOrThrow()
            if (act_value != exp_values[i]) {
                return 2
            }
        }
        return 0
    }
    return 1
}
