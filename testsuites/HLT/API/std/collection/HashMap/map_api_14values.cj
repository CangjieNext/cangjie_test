/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f  -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var map01: HashMap<Int64, Int64> = HashMap<Int64, Int64>([(3, 3), (4, 5), (5, 6)])
    var list_values1 = map01.values()
    var list_values: Array<Int64> = [3, 5, 6]
    if (list_values1.size == 3) {
        var it = list_values1.iterator()
        for (i in 0..list_values1.size) {
            var act_value = it.next().getOrThrow()
            if (act_value != list_values[i]) {
                return 2
            }
        }
        return 0
    }
    return 1
    return 0
}
