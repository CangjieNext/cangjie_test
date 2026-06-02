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

func cmp(lhs: UInt64, rhs: UInt64): Ordering {
    return lhs.compare(rhs)
}

func cmp2(lhs: UInt64, rhs: UInt64): Ordering {
    return rhs.compare(lhs)
}

main(): Int64 {
    var a1 = ArrayList<UInt64>([1, 5, 2, 0, 8])
    var a2 = ArrayList<UInt64>([1, 5, 2, 0, 8])
    a1.sortBy(comparator: cmp)
    a2.sortBy(comparator: cmp2)
    if (a1[0] != 0 || a1[1] != 1 || a1[2] != 2 || a1[3] != 5 || a1[4] != 8) {
        return 1
    }
    if (a2[0] != 8 || a2[1] != 5 || a2[2] != 2 || a2[3] != 1 || a2[4] != 0) {
        return 2
    }
    return 0
}
