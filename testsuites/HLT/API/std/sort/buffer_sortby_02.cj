/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

var mut1 = ArrayList<Int64>([4, 4, 4, 4, 4, 4, 4, 4, 7434, 83131231, 32131, 32328])
var mut2 = ArrayList<Int64>([4, 4, 4, 4, 4, 4, 4, 4, 7434, 83131231, 32131, 32328])
var mut3 = ArrayList<Int64>([56, 4354, 4, 776, 5, 4, 63233, 7434, 83131231, 32131, 32328])
var mut4 = ArrayList<Int64>([56, 4354, 4, 776, 5, 4, 63233, 7434, 83131231, 32131, 32328])

func case01(com: (Int64, Int64) -> Ordering) {
    var a1 = mut1.sortBy(comparator: com)
}

func case02(com: (Int64, Int64) -> Ordering) {
    var a2 = mut3.sortBy(comparator: com)
}

func foo1(x: Int64, y: Int64): Ordering {
    if (x * y == x * y) {
        return Ordering.LT
    } else {
        return Ordering.GT
    }
}

func foo2(x: Int64, y: Int64): Ordering {
    if (x != y) {
        return Ordering.LT
    } else {
        return Ordering.GT
    }
}

main(): Int64 {
    case01(foo1)
    case02(foo2)

    if (mut1 != mut2) {
        return 1
    }
    if (mut3 != mut4) {
        return 2
    }
    return 0
}
