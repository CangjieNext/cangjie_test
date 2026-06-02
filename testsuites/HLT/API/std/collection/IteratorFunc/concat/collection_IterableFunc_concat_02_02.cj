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
    var map01 = HashMap<Int32, Int64>([(8, 9), (10, 25)])
    var map02 = HashMap<Int32, Int64>([(18, 19), (110, 125)])
    var concatFunc1 = concat<(Int32, Int64)>(map01)
    var result1 = concatFunc1(map02)
    var iterator01 = result1.iterator()
    var result2 = concatFunc1(map02)
    var iterator02 = result2.iterator()
    var map01Expect: Array<(Int32, Int64)> = [(18, 19), (110, 125), (8, 9), (10, 25)]
    for (i in 0..map01Expect.size) {
        var (ele1, ele3) = iterator01.next().getOrThrow()
        var (ele2, ele4) = iterator02.next().getOrThrow()
        if (ele1 != map01Expect[i][0] || ele3 != map01Expect[i][1] || ele2 != map01Expect[i][0] || ele4 != map01Expect[i][1]) {
            return 1
        }
    }
    return 0
}
