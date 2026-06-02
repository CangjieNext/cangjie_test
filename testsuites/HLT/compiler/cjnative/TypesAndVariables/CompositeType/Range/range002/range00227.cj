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

extend Range<Int64> {
    public func plus(b: Range<Int64>): Range<Int64> {
        var a_index = 0
        var b_index = 0
        for (i in this) {
            a_index++
        }
        for (i in b) {
            b_index++
        }
        return a_index..b_index
    }
}

main(): Int64 {
    var range1 = 0..1
    var range2 = 0..10
    var range3 = range1.plus(range2) // range3 == 1..10
    var a = [10, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var res = 0
    for (i in a[range3]) {
        res = res + i
    }
    if (res == 45) {
        return 0
    }
    return 1
}
