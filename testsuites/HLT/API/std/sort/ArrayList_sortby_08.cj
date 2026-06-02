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

class A {
    var a: Int64
    public init(a: Int64) {
        this.a = a
    }
}

func comp(lhs: A, rhs: A): Ordering {
    var value1 = lhs.a
    var value2 = rhs.a
    return value1.compare(value2)
}

func comp2(lhs: A, rhs: A): Ordering {
    var value1 = lhs.a
    var value2 = rhs.a
    return value2.compare(value1)
}

main(): Int64 {
    var a1 = ArrayList<A>([A(1), A(2)])
    var a2 = ArrayList<A>([A(1), A(2)])
    a1.sortBy(comparator: comp)
    a2.sortBy(comparator: comp2)
    if (a1[0].a != 1 || a1[1].a != 2) {
        return 1
    }
    if (a2[0].a != 2 || a2[1].a != 1) {
        return 2
    }
    return 0
}
