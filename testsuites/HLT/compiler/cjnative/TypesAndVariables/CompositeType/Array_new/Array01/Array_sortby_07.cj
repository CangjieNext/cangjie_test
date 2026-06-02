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

var a1: Array<Array<Int8>> = [[1, 5, 2, 0, 8], [9, 5, 2, 0, 8]]

main(): Int64 {
    a1.sortBy(stable: true) {a, b => a[0].compare(b[0])}
    a1[0].sortBy(stable: true) {a, b => b.compare(a)}

    if (a1[0][0] == 8 && a1[0][1] == 5 && a1[0][2] == 2 && a1[0][3] == 1 && a1[0][4] == 0) {
        return 0
    }
    return 1
}
