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
's'
"""
    var arr1 = ["1", "s", #"s"#, "！", "$", "", "中", "er", "'1''2''3'", "'1','2','3'", "3.4444", "${'s'}", longstr,
        mutistr1, mutistr2]
    var count = 0
    for (i in arr1) {
        try {
            Rune.tryParse(i).getOrThrow()
        } catch (e: NoneValueException) {
            count += 1
        }
    }
    if (count != arr1.size) {
        return 1
    }
    return 0
}
