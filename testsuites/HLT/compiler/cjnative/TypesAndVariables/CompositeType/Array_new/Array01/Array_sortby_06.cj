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

var a1: Array<Bool> = [true, true, false]

func comp(lhs: Bool, rhs: Bool): Ordering {
    if (!lhs && rhs) {
        return Ordering.LT
    } else {
        return Ordering.GT
    }
}

main(): Int64 {
    a1.sortBy(stable: true, comparator: comp)
    print(a1[0].toString())

    if (a1[0] == false && a1[1] == true && a1[2] == true) {
        return 0
    }
    return 1
}
