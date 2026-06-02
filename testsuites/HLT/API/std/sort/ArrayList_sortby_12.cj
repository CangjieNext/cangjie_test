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

var a1 = ArrayList<TimeUnit>([TimeUnit.Month, TimeUnit.Second])
var a2 = ArrayList<TimeUnit>([TimeUnit.Month, TimeUnit.Second])

enum TimeUnit {
    | Year | Month | Second
}

func comp(lhs: TimeUnit, rhs: TimeUnit): Ordering {
    let lhsPrefer: Bool = match (lhs) {
        case Year => false
        case Month => true
        case Second => false
        case _ => false
    }

    let rhsPrefer: Bool = match (rhs) {
        case Year => false
        case Month => false
        case Second => true
        case _ => false
    }

    if (!lhsPrefer && !rhsPrefer) {
        return Ordering.GT
    } else {
        return Ordering.LT
    }
}

main(): Int64 {
    a1.sortBy(comparator: comp)
    a2.sortBy(comparator: comp, stable: true)

    let enumSort3: Bool = match (a1[1]) {
        case Year => false
        case Month => true
        case Second => false
        case _ => false
    }

    let enumSort4: Bool = match (a1[0]) {
        case Year => false
        case Month => false
        case Second => true
        case _ => false
    }
    let enumSort1: Bool = match (a2[1]) {
        case Year => false
        case Month => true
        case Second => false
        case _ => false
    }

    let enumSort2: Bool = match (a2[0]) {
        case Year => false
        case Month => false
        case Second => true
        case _ => false
    }
    if (enumSort1 != false || enumSort2 != false) {
        return 1
    }
    if (enumSort4 != false || enumSort3 != false) {
        return 2
    }
    return 0
}
