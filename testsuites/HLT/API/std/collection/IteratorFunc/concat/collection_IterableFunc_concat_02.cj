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
    var concatFunc1 = concat<Int32>(arr1)
    var result1 = concatFunc1(arr2)
    var iterator01 = result1.iterator()
    var result2 = concatFunc1(arr2)
    var iterator02 = result2.iterator()
    var arr1Expect: Array<Int32> = [18, 8, 120, 125, 8, 9, 10, 25]
    for (i in 0..arr1Expect.size) {
        var ele1 = iterator01.next().getOrThrow()
        var ele2 = iterator02.next().getOrThrow()
        if (ele1 != arr1Expect[i] || ele2 != arr1Expect[i]) {
            return 1
        }
    }
    var set1 = HashSet<Int32>([8, 9, 10, 25])
    var set2 = HashSet<Int32>([18, 8, 120, 125])
    var concatFunc2 = concat<Int32>(set1)
    var result3 = concatFunc2(set2)
    var iterator03 = result3.iterator()
    var result4 = concatFunc2(set2)
    var iterator04 = result4.iterator()
    for (i in 0..arr1Expect.size) {
        var ele3 = iterator03.next().getOrThrow()
        var ele4 = iterator04.next().getOrThrow()
        if (ele3 != arr1Expect[i] || ele4 != arr1Expect[i]) {
            return 2
        }
    }

    return 0
}
