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

var map02: HashMap<Int32, String> = HashMap<Int32, String>(5, {x: Int64 => (Int32(x), x.toString())})
var set_keys: Array<Int32> = [0, 1, 2, 3, 4]
var list_values: Array<String> = ["0", "1", "2", "3", "4"]

main(): Int64 {
    var keys = map02.keys()
    var values = map02.values()
    if (values.size == 5 && keys.size == 5) {
        var it_keys = keys.iterator()
        var it_values = values.iterator()
        for (i in 0..values.size) {
            var act_key = it_keys.next().getOrThrow()
            var act_value = it_values.next().getOrThrow()
            if (act_value != list_values[i] || act_key != set_keys[i]) {
                return 2
            }
        }
        return 0
    }
    return 1
}
