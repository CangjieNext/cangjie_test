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
    var arr1 = Array<Int8>()
    var arr2 = Array<Int16>()
    var arr3 = Array<Int32>()
    var arr4 = Array<Int64>()
    var set1 = HashSet<UInt8>()
    var set2 = HashSet<UInt16>()
    var set3 = HashSet<UInt32>()
    var set4 = HashSet<UInt64>()
    var arrlist1 = ArrayList<Rune>()
    var arrlist2 = ArrayList<Float16>()
    var arrlist3 = ArrayList<String>()
    var cases01 = [testIterableCollectString<Int8>(arr1, ",", ""), testIterableCollectString<Int16>(arr2, ",", ""),
        testIterableCollectString<Int32>(arr3, ",", ""), testIterableCollectString<Int64>(arr4, ",", ""),
        testIterableCollectString<UInt8>(set1, ",", ""), testIterableCollectString<UInt16>(set2, ",", ""),
        testIterableCollectString<UInt32>(set3, ",", ""), testIterableCollectString<UInt64>(set4, ",", ""),
        testIterableCollectString<Rune>(arrlist1, ",", ""), testIterableCollectString<Float16>(arrlist2, ",", ""),
        testIterableCollectString<String>(arrlist3, ",", "")]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        return 1
    }
    return 0
}
