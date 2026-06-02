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

main(): Int64 {
    var a1: Array<Int8> = [1, 9, 5, 3, 2, 0]
    var a2: Array<Int8> = [1, 9, 5, 3, 2, 0]
    var a3: Array<Int8> = [1, 9, 5, 3, 2, 0]
    a1.sort()
    a2.sort(stable: false)
    a3.sort(stable: true)
    if (a1[0] != 0 || a1[1] != 1 || a1[2] != 2 || a1[3] != 3 || a1[4] != 5 || a1[5] != 9) {
        return 1
    }
    if (a2[0] != 0 || a2[1] != 1 || a2[2] != 2 || a2[3] != 3 || a2[4] != 5 || a2[5] != 9) {
        return 2
    }
    if (a3[0] != 0 || a3[1] != 1 || a3[2] != 2 || a3[3] != 3 || a3[4] != 5 || a3[5] != 9) {
        return 3
    }
    return 0
}
