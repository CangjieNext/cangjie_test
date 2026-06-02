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
    var arr1: Array<Int8> = [8]
    var arr2: Array<Int16> = [8]
    var arr3: Array<Int32> = [8]
    var arr4: Array<Int64> = [8]
    var set1 = HashSet<UInt8>([8])
    var set2 = HashSet<UInt16>([8])
    var set3 = HashSet<UInt32>([8])
    var set4 = HashSet<UInt64>([8])
    var arrlist1 = ArrayList<Rune>([r'8'])
    var arrlist2 = ArrayList<Float16>([Float16(8)])
    var arrlist3 = ArrayList<String>(["8"])
    var cases01 = [testIterableCollectString<Int8>(arr1, ",", "8"), testIterableCollectString<Int16>(arr2, ",", "8"),
        testIterableCollectString<Int32>(arr3, ",", "8"), testIterableCollectString<Int64>(arr4, ",", "8"),
        testIterableCollectString<UInt8>(set1, ",", "8"), testIterableCollectString<UInt16>(set2, ",", "8"),
        testIterableCollectString<UInt32>(set3, ",", "8"), testIterableCollectString<UInt64>(set4, ",", "8"),
        testIterableCollectString<Rune>(arrlist1, ",", "8"), testIterableCollectString<Float16>(arrlist2, ",",
        "8.000000"), testIterableCollectString<String>(arrlist3, ",", "8")]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
