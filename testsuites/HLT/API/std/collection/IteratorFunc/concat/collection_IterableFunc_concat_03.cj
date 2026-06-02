/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj concatLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj concatLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<Int8> = [8, 9, 10, 25]
    var arr2 = Array<Int8>()
    var set1 = HashSet<Int16>([8, 9, 10, 25])
    var set2 = HashSet<Int16>()
    var arrlist1 = ArrayList<Int32>([8, 9, 10, 25])
    var arrlist2 = ArrayList<Int32>()
    var cases01 = [testIterableConcat<Int8>(arr2, arr2, arr2), testIterableConcat<Int8>(arr1, arr2, arr1),
        testIterableConcat<Int8>(arr2, arr1, arr1), testIterableConcat<Int16>(set2, set2, set2),
        testIterableConcat<Int16>(set1, set2, set1), testIterableConcat<Int16>(set2, set1, set1),
        testIterableConcat<Int32>(arrlist2, arrlist2, arrlist2), testIterableConcat<Int32>(arrlist2, arrlist1, arrlist1),
        testIterableConcat<Int32>(arrlist1, arrlist2, arrlist1)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
