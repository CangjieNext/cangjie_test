/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj isEmptyLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj isEmptyLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1: Array<A> = [A(1), A(2), A(3)]
    var arrlist1 = ArrayList<B>([B(1), B(2), B(3)])
    var set1 = HashSet<C>([C(1), C(2), C(3)])
    var map1 = HashMap<A, C>([(A(1), C(1)), (A(2), C(2)), (A(3), C(3))])

    var cases01 = [
        testIterableIsEmpty<A>(arr1, false),
        testIterableIsEmpty<B>(arrlist1, false),
        testIterableIsEmpty<C>(set1, false),
        testIterableIsEmpty<(A, C)>(map1, false)
    ]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        return 1
    }
    return 0
}
