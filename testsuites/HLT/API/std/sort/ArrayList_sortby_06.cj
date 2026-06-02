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

func comp(lhs: Bool, rhs: Bool): Ordering {
    if (!lhs && rhs) {
        return Ordering.LT
    } else {
        return Ordering.GT
    }
}

func comp2(lhs: Bool, rhs: Bool): Ordering {
    if (!lhs && rhs) {
        return Ordering.GT
    } else {
        return Ordering.LT
    }
}

main(): Int64 {
    var a1 = ArrayList<Bool>([true, true, false])
    var a2 = ArrayList<Bool>([true, true, false])
    a1.sortBy(comparator: comp)
    a2.sortBy(comparator: comp2)
    if (a1[0] != false || a1[1] != true || a1[2] != true) {
        return 1
    }
    if (a2[0] != true || a2[1] != true || a2[2] != false) {
        return 2
    }
    return 0
}
