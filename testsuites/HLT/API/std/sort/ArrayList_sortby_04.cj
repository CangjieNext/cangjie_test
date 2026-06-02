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

func comp(lhs: Rune, rhs: Rune): Ordering {
    return lhs.compare(rhs)
}

func comp2(lhs: Rune, rhs: Rune): Ordering {
    return rhs.compare(lhs)
}

main(): Int64 {
    var a1 = ArrayList<Rune>([r's', r'd', r'r'])
    var a2 = ArrayList<Rune>([r's', r'd', r'r'])
    a1.sortBy(comparator: comp)
    a2.sortBy(comparator: comp2)

    if (a1[0] != r'd' || a1[1] != r'r' || a1[2] != r's') {
        return 1
    }
    if (a2[0] != r's' || a2[1] != r'r' || a2[2] != r'd') {
        return 2
    }
    return 0
}
