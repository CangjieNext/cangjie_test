/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: collectHashSetLogic.cj
// EXEC: %compiler %cmp_opt %f collectHashSetLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
import std.collection.*
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
    var set4 = HashSet<Bool>()
    var set5 = HashSet<Rune>([r'a', r'中', r'*'])
    var set6 = HashSet<String>(["fdsfdsfsdf", "中67……*&（））"])

    var cases01 = [testIterableCollectHashSet<Int32>(arr1), testIterableCollectHashSet<Int64>(arr2),
        testIterableCollectHashSet<UInt32>(arr3), testIterableCollectHashSet<UInt64>(arr4),
        testIterableCollectHashSet<Int8>(arrlist1), testIterableCollectHashSet<Int16>(arrlist2),
        testIterableCollectHashSet<Float32>(arrlist3), testIterableCollectHashSet<Float16>(arrlist4),
        testIterableCollectHashSet<UInt8>(set1), testIterableCollectHashSet<UInt16>(set2),
        testIterableCollectHashSet<Float64>(set3), testIterableCollectHashSet<Bool>(set4),
        testIterableCollectHashSet<Rune>(set5), testIterableCollectHashSet<String>(set6)]
    var resultExpexct = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpexct) {
        return 1
    }
    return 0
}
