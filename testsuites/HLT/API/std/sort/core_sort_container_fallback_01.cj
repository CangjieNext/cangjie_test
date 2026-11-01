/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*
import std.sort.*

main(): Int64 {
    var arrayList = ArrayList<Int32>([5, 1, 4, 1, 3])
    sort(arrayList, stable: true)
    if (arrayList != ArrayList<Int32>([1, 1, 3, 4, 5])) {
        return 1
    }

    var list: List<Int32> = ArrayList<Int32>([5, 1, 4, 1, 3])
    sort(list, stable: false)
    if (list.toArray() != [1, 1, 3, 4, 5]) {
        return 2
    }

    var strings: Array<String> = ["gamma", "alpha", "beta", "alpha"]
    sort(strings, stable: true)
    if (strings != ["alpha", "alpha", "beta", "gamma"]) {
        return 3
    }

    var empty: Array<Int64> = []
    var single: Array<Int64> = [7]
    sort(empty)
    sort(single, stable: true)
    if (empty.size != 0 || single != [7]) {
        return 4
    }
    return 0
}
