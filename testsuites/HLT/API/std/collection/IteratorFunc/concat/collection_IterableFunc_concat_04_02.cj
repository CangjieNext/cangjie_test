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
    var map1 = HashMap<A, C>([(A(1), C(1)), (A(2), C(2)), (A(3), C(3))])
    var map2 = HashMap<A, C>([(A(2), C(2)), (A(3), C(3)), (A(4), C(4))])
    var map3 = HashMap<A, C>()
    var mapExpect01 = [(A(2), C(2)), (A(3), C(3)), (A(4), C(4)), (A(1), C(1)), (A(2), C(2)), (A(3), C(3))]
    var mapExpect02 = [(A(1), C(1)), (A(2), C(2)), (A(3), C(3)), (A(1), C(1)), (A(2), C(2)), (A(3), C(3))]
    var cases01 = [testIterableConcat<A, C>(map1, map2, mapExpect01), testIterableConcat<A, C>(map1, map3, map1),
        testIterableConcat<A, C>(map1, map1, mapExpect02)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
