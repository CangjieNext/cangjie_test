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

import std.sort.*

var a1: Array<TimeUnit> = [TimeUnit.Month, TimeUnit.Second]

enum TimeUnit {
    | Year | Month | Second
}

func comp(lhs: TimeUnit, rhs: TimeUnit): Ordering {
    let lhsPrefer: Bool = match (lhs) {
        case Year => false
        case Month => true
        case Second => false
    }

    let rhsPrefer: Bool = match (rhs) {
        case Year => false
        case Month => false
        case Second => true
    }

    if (!lhsPrefer && !rhsPrefer) {
        return Ordering.LT
    } else {
        return Ordering.GT
    }
}

main(): Int64 {
    a1.sortBy(stable: true, comparator: comp)

    let enumSort3: Bool = match (a1[1]) {
        case Year => false
        case Month => true
        case Second => false
    }

    let enumSort4: Bool = match (a1[0]) {
        case Year => false
        case Month => false
        case Second => true
    }

    if (enumSort3 && enumSort4) {
        return 0
    }
    return 1
}
