/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

func comp(lhs: Float32, rhs: Float32): Ordering {
    return rhs.compare(lhs)
}

func comp2(lhs: Float32, rhs: Float32): Ordering {
    return lhs.compare(rhs)
}

main(): Int64 {
    var a1 = ArrayList<Float32>([1.0, 5.25, 1.002, 5.222, 1.001])
    var a2 = ArrayList<Float32>([1.0, 5.25, 1.002, 5.222, 1.001])
    a1.sortBy(comparator: comp)
    a2.sortBy(comparator: comp2)
    if (a1[0] != Float32(5.25) || a1[1] != Float32(5.222) || a1[2] != Float32(1.002) || a1[3] != Float32(1.001) ||
        a1[4] != Float32(1.0)) {
        return 1
    }
    if (a2[0] != Float32(1.0) || a2[1] != Float32(1.001) || a2[2] != Float32(1.002) || a2[3] != Float32(5.222) ||
        a2[4] != Float32(5.25)) {
        return 2
    }
    return 0
}
