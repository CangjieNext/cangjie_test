/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj containsLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj containsLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1: Array<A> = [A(9), A(10), A(11), B(9), B(10), B(11)]
    var arr2 = Array<A>()
    var arr3: Array<C> = [C(9), C(10), C(11)]
    var arrlist1 = ArrayList<A>([A(9), A(10), A(11), B(9), B(10), B(11)])
    var arrlist2 = ArrayList<A>()
    var arrlist3 = ArrayList<C>([C(9), C(10), C(11)])
    var set1 = HashSet<A>([A(9), A(10), A(11), B(9), B(10), B(11)])
    var set2 = HashSet<A>()
    var set3 = HashSet<C>([C(9), C(10), C(11)])

    var cases01 = [testIterableContains<A>(arr1, A(9), true), testIterableContains<A>(arr1, B(12), false),
        testIterableContains<A>(arr2, B(11), false), testIterableContains<C>(arr3, C(11), true),
        testIterableContains<C>(arr3, C(12), false), testIterableContains<A>(arrlist1, A(9), true),
        testIterableContains<A>(arrlist1, B(12), false), testIterableContains<A>(arrlist2, B(11), false),
        testIterableContains<C>(arrlist3, C(11), true), testIterableContains<C>(arrlist3, C(12), false),
        testIterableContains<A>(set1, A(9), true), testIterableContains<A>(set1, B(12), false),
        testIterableContains<A>(set2, B(11), false), testIterableContains<C>(set3, C(11), true),
        testIterableContains<C>(set3, C(12), false)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
