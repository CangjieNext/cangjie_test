/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

var a1 = ArrayList<Int32>([1, 5, 2, 4, 3])
var a2 = ArrayList<Int32>([1, 5, 2, 4, 3])

func comp(data1: Int32, data2: Int32): Ordering {
    return Ordering.GT
}

main(): Int64 {
    a1.sortBy(comparator: comp)
    a2.sortBy(comparator: comp, stable: true)
    if (a1[0] != 3 || a1[1] != 4 || a1[2] != 2 || a1[3] != 5 || a1[4] != 1) {
        return 1
    }
    if (a2[0] != 3 || a2[1] != 4 || a2[2] != 2 || a2[3] != 5 || a2[4] != 1) {
        return 2
    }
    return 0
}
