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

var mut1 = ArrayList<Int64>([56, 4354, 4, 776, 5, 63233, 7434, 83131231, 32131, 32328])
var mut2 = ArrayList<Int64>([4, 5, 56, 776, 4354, 7434, 32131, 32328, 63233, 83131231])

func case01(com: (Int64, Int64) -> Ordering) {
    var a = mut1.sortBy(comparator: com)
}

func foo(x: Int64, y: Int64): Ordering {
    if (x < y) {
        return Ordering.LT
    } else if (x > y) {
        return Ordering.GT
    } else {
        return Ordering.EQ
    }
}

main(): Int64 {
    case01(foo)

    if (mut1 != mut2) {
        return 1
    }
    return 0
}
