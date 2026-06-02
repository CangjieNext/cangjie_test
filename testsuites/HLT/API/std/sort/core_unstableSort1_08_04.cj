/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.sort.*

main(): Int64 {
    var arr: Array<Int64> = [6, 8, 78, 21, 45, 23, 75, 78, 43]
    var expArr = [6, 8, 78, 21, 45, 23, 75, 78, 43]
    try {
        unstableSort(arr[0..arr.size + 1])
    } catch (e: IndexOutOfBoundsException) {
        return 0
    }
    return 1
}
