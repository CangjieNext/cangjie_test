/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main() {
    var begin = 0
    var end = 3
    var array1 = ArrayList<Int64>([])
    var array2 = ArrayList<Int64>([])
    for (i in begin + 1..=end - 2 : 1) {
        array1.add(i)
    }
    for (i in begin + 1..=end - 2) {
        array2.add(i)
    }
    if (array1 == array2) {
        return 0
    }
    return 1
}
