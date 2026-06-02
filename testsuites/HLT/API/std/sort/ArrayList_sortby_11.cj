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

struct A {
    A(var ra!: Int64 = 0, let rb!: Int64 = 0) {
    }
}

var a1 = ArrayList<A>([A(ra: 4, rb: 1), A(ra: 1, rb: 1)])
var a2 = ArrayList<A>([A(ra: 4, rb: 1), A(ra: 1, rb: 1)])

func comp(lhs: A, rhs: A): Ordering {
    if (rhs.ra - lhs.ra > 0) {
        return Ordering.LT
    } else {
        return Ordering.GT
    }
}

main(): Int64 {
    a1.sortBy(comparator: comp)
    a2.sortBy(comparator: comp, stable: true)
    if (a1[0].ra != 1 || a1[0].rb != 1 || a1[1].ra != 4 || a1[1].rb != 1) {
        return 1
    }
    if (a2[0].ra != 1 || a2[0].rb != 1 || a2[1].ra != 4 || a2[1].rb != 1) {
        return 2
    }
    return 0
}
