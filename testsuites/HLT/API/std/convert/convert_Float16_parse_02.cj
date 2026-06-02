/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
import std.collection.*

main(): Int64 {
    var mutistr1 = """
dsd
dasd
dsa
"""
    var mutistr2 = """
 1.2 222 
"""
    var arr1 = ["er", "中", "true", "false", "$%#$%@#%&*^", "￥%……￥……%￥……&", "", mutistr1, mutistr2]
    var count = 0
    for (i in arr1) {
        try {
            Float16.parse(i)
        } catch (e: IllegalArgumentException) {
            count += 1
        }
    }
    if (count != arr1.size) {
        return 1
    }
    return 0
}
