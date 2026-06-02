/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.sort.*

main(): Int64 {
    var arr: Array<Int64> = Array<Int64>()
    unstableSort(arr[0..0], test)
    if (arr.size != 0) {
        return 1
    }
    return 0
}

func test(t1: Int64, t2: Int64): Ordering {
    if (t1 > t2) {
        return Ordering.GT
    } else if (t1 < t2) {
        return Ordering.LT
    }
    return Ordering.EQ
}
