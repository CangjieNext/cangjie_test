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

main() {
    var arr = [3, 45, 1, 65, 1, 2]
    let res = [1, 1, 2, 3, 45, 65]
    arr.sortBy(stable: true) {a, b => a.compare(b)}
    var i = 0
    for (e in arr) {
        if (e != res[i]) {
            return 1
        }
        i++
    }
    if (i != arr.size || i != 6) {
        return 2
    }

    return 0
}
