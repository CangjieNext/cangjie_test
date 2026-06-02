/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: filterLogic.cj
// EXEC: %compiler %cmp_opt %f filterLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<Int64> = [8, 9, 10, 25]
    var arr2 = Array<Float64>()
    var str1 = "dbadahjdga4242424中jhgdhjad"
    var str2 = ""
    var set1 = HashSet<Int32>([8, 9, 10, 25])
    var set2 = HashSet<Int8>()
    var arraylist1 = ArrayList<Int16>([8, 9, 10, 25])
    var arraylist2 = ArrayList<UInt32>()
    var cases01 = [
        testIterableFilter<Int64>(arr1, {a: Int64 => false}),
        testIterableFilter<Float64>(arr2, {a: Float64 => false}),
        testIterableFilter<Byte>(str1, {a: Byte => false}),
        testIterableFilter<Byte>(str2, {a: Byte => false}),
        testIterableFilter<Int32>(set1, {a: Int32 => false}),
        testIterableFilter<Int8>(set2, {a: Int8 => false}),
        testIterableFilter<Int16>(arraylist1, {a: Int16 => false}),
        testIterableFilter<UInt32>(arraylist2, {a: UInt32 => false})
    ]
    var resultExpexct1 = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpexct1) {
        return 1
    }
    return 0
}
