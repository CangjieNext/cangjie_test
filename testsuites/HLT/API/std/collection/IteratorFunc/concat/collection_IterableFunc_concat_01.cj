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
    var arr1: Array<Int32> = [8, 9, 10, 25]
    var arr2: Array<Int32> = [18, 8, 120, 125]
    var arr1Expect: Array<Int32> = [18, 8, 120, 125, 8, 9, 10, 25]
    var arr2Expect: Array<Int32> = [8, 9, 10, 25, 8, 9, 10, 25]
    var set1 = HashSet<Int32>([8, 9, 10, 25])
    var set2 = HashSet<Int32>([18, 8, 120, 125])
    var arrlist1 = ArrayList<Int32>([8, 9, 10, 25])
    var arrlist2 = ArrayList<Int32>([18, 8, 120, 125])
    var cases01 = [testIterableConcat<Int32>(arr1, arr2, arr1Expect), testIterableConcat<Int32>(arr1, arr1, arr2Expect),
        testIterableConcat<Int32>(arrlist1, arrlist2, arr1Expect),
        testIterableConcat<Int32>(arrlist1, arrlist1, arr2Expect), testIterableConcat<Int32>(set1, set2, arr1Expect),
        testIterableConcat<Int32>(set1, set1, arr2Expect)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
