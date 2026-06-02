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

func comp(lhs: String, rhs: String): Ordering {
    return lhs.compare(rhs)
}

func comp2(lhs: String, rhs: String): Ordering {
    return rhs.compare(lhs)
}

main(): Int64 {
    var a1 = ArrayList<String>(["aa", "bb", "dd", "cc"])
    var a2 = ArrayList<String>(["aa", "bb", "dd", "cc"])
    a1.sortBy(comparator: comp)
    a2.sortBy(comparator: comp2)
    if (a1[0] != "aa" || a1[1] != "bb" || a1[2] != "cc" || a1[3] != "dd") {
        return 1
    }
    if (a2[0] != "dd" || a2[1] != "cc" || a2[2] != "bb" || a2[3] != "aa") {
        return 2
    }
    return 0
}
