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
    var longstr = ""
    for (i in 0..1000) {
        longstr += i.toString()
    }
    var mutistr1 = """
dsd
dasd
dsa
"""
    var mutistr2 = """
true
"""

    var arr1 = [negstr1, negstr2, negstr3, negstr4, negstr5, negstr6]
    var arr2 = ["ttruee", "ffalsee", "asdsafdfas123", "", "#$#$%$#%^#", "！@#￥￥%…………&%*&%……", "34232", "'a'",
        "3.4.4.4.4", "3.55555555555", longstr, mutistr1, mutistr2]
    var count1 = 0
    var count2 = 0
    for (i in arr1) {
        try {
            Bool.tryParse(i).getOrThrow()
        } catch (e: NoneValueException) {
            count1 += 1
        }
    }
    for (i in arr2) {
        try {
            Bool.tryParse(i).getOrThrow()
        } catch (e: NoneValueException) {
            count2 += 1
        }
    }
    if (count1 != arr1.size && count2 != arr2.size) {
        return 1
    }
    return 0
}
