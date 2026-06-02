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

func cmp(lhs: Int64, rhs: Int64): Ordering {
    return lhs.compare(rhs)
}

func cmp2(lhs: Int64, rhs: Int64): Ordering {
    return rhs.compare(lhs)
}

main() {
    var arr1 = ArrayList<Int64>([3, 45, 1, 65, 1, 2])
    var arr2 = ArrayList<Int64>([3, 45, 1, 65, 1, 2])
    let res1 = ArrayList<Int64>([1, 1, 2, 3, 45, 65])
    let res2 = ArrayList<Int64>([65, 45, 3, 2, 1, 1])
    arr1.sortBy(comparator: cmp)
    arr2.sortBy(comparator: cmp2)
    if (arr1 != res1 || arr2 != res2 || arr1.size != 6 || arr2.size != 6) {
        return 1
    }
    return 0
}
