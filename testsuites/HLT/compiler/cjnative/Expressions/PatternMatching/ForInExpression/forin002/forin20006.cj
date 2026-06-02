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

import std.collection.*

enum E1 {
    | A1 | A2(Int64) | A3(Int64, Int64) | ...
}

main() {
    let arr = ArrayList<E1>([A1, A2(0), A3(1, 0)])
    for (ele in arr) {
        ele
    }
    0
}
