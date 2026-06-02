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
    var negstr1 = "True"
    var negstr2 = "False"
    var negstr3 = "TRUE"
    var negstr4 = "FALSE"
    var negstr5 = ###"
true"###
    var negstr6 = ###"
false"###

    var arr1 = [negstr1, negstr2, negstr3, negstr4, negstr5, negstr6]
    var count = 0
    for (i in arr1) {
        try {
            Bool.parse(i)
        } catch (e: IllegalArgumentException) {
            count += 1
        }
    }
    if (count != arr1.size) {
        return 1
    }
    return 0
}
