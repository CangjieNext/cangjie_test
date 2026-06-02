/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: collectarrayLogic.cj
// EXEC: %compiler %cmp_opt %f collectarrayLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1: Array<Int32> = [8, 9, 10, 25, 18, 19, 120, 125]
    var arr2 = Array<Int64>()
    var arr3: Array<UInt32> = [8, 9, 10, 25, 18, 19, 120, 125]
    var arr4 = Array<UInt64>()
    var arrlist1 = ArrayList<Int8>([8, 9, 10, 25, 18, 19, 120, 125])
    var arrlist2 = ArrayList<Int16>()
    var arrlist3 = ArrayList<Float32>(
        [Float32(8), Float32(9), Float32(10), Float32(25), Float32(18), Float32(19), Float32(120), Float32(125)])
    var arrlist4 = ArrayList<Float16>()
    var set1 = HashSet<UInt8>([8, 9, 10, 25, 18, 19, 120, 125])
    var set2 = HashSet<UInt16>()
    var set3 = HashSet<Float64>(
        [Float64(8), Float64(9), Float64(10), Float64(25), Float64(18), Float64(19), Float64(120), Float64(125)])
    var set4 = HashSet<Rune>([r'a', r'中', r'*'])
    var set5 = HashSet<String>(["fdsfdsfsdf", "中67……*&（））"])

    var casesresult = [testIterableCollectArray<Int32>(arr1), testIterableCollectArray<Int64>(arr2),
        testIterableCollectArray<UInt32>(arr3), testIterableCollectArray<UInt64>(arr4),
        testIterableCollectArray<Int8>(arrlist1), testIterableCollectArray<Int16>(arrlist2),
        testIterableCollectArray<Float32>(arrlist3), testIterableCollectArray<Float16>(arrlist4),
        testIterableCollectArray<UInt8>(set1), testIterableCollectArray<UInt16>(set2),
        testIterableCollectArray<Float64>(set3), testIterableCollectArray<Rune>(set4),
        testIterableCollectArray<String>(set5)]
    var resultExpexct = Array<Int64>(casesresult.size, repeat: 0)
    if (casesresult != resultExpexct) {
        return 1
    }
    return 0
}
