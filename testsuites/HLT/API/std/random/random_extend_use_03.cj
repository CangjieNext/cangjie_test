/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.random.*
import std.collection.*

main() {
    var n = Random()
    var n1 = Random(1)
    var n2 = Random()
    var buf: ArrayList<Random> = ArrayList<Random>([n, n1, n2])
    if (buf.size != 3) {
        return 1
    }
    return 0
}
