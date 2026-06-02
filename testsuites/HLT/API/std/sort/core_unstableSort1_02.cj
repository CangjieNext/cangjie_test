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
    var arr: Array<Int64> = [8, 6, 78, 21, 45, 23, 75, 78, 43]
    var expArr = [6, 8, 21, 23, 43, 45, 75, 78, 78]
    unstableSort(arr[0..9])
    if (arr != expArr) {
        return 1
    }
    return 0
}
