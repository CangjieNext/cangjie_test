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

var a1: Array<Float32> = [1.0, 5.25, 1.002, 5.222, 1.001]

main(): Int64 {
    a1.sortBy(stable: true) {a, b => b.compare(a)}

    if (a1[0] == 5.25 && a1[1] == 5.222 && a1[2] == 1.002 && a1[3] == 1.001 && a1[4] == 1.0) {
        return 0
    }
    return 1
}
