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

var a1 = [r's', r'd', r'r']

main(): Int64 {
    a1.sortBy(stable: true) {a, b => a.compare(b)}

    if (a1[0] == r'd' && a1[1] == r'r' && a1[2] == r's') {
        return 0
    }
    return 1
}
