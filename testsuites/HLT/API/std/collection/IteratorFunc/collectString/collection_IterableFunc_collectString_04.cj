/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: collectStringLogic.cj
// EXEC: %compiler %cmp_opt %f collectStringLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1: Array<Int8> = [8, 9]
    var longstr = ""
    for (i in 0..1000) {
        longstr = longstr + i.toString()
    }
    var multistr = """
dsd
dsd
"""
    var originstr = #"dsds"#
    var cases01 = [
        testIterableCollectString<Int8>(arr1, "m", "8m9"),
        testIterableCollectString<Int8>(arr1, "4", "849"),
        testIterableCollectString<Int8>(arr1, "%", "8%9"),
        testIterableCollectString<Int8>(arr1, "中", "8中9"),
        testIterableCollectString<Int8>(arr1, "￥", "8￥9"),
        testIterableCollectString<Int8>(arr1, "${longstr}", "8${longstr}9"),
        testIterableCollectString<Int8>(arr1, "${multistr}", "8${multistr}9"),
        testIterableCollectString<Int8>(arr1, "${originstr}", "8${originstr}9")
    ]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        return 1
    }
    return 0
}
