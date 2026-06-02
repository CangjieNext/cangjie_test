/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output
// (not Windows) RUN-EXEC: %run %run_opt %output %run_args

import std.math.*

main() {
    let x = Float64.NaN
    var y = 3.14
    var z = x < y // z = false
    var v = x != x // v = true
    var w = (x < y) == !(x >= y) // w = false
    if ((!z) && v && (!w)) {
        return 0
    }
    return 1
}
