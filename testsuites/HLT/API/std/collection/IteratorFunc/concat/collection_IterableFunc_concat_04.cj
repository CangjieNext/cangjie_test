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
    var arr1: Array<A> = [A(1), A(2), A(3)]
    var arr2 = Array<A>()
    var arrlist1 = ArrayList<B>([B(1), B(2), B(3)])
    var arrlist2 = ArrayList<B>()
    var set1 = HashSet<C>([C(1), C(2), C(3)])
    var set2 = HashSet<C>()

    var cases01 = [testIterableConcat<A>(arr2, arr2, arr2), testIterableConcat<A>(arr1, arr2, arr1),
        testIterableConcat<A>(arr2, arr1, arr1), testIterableConcat<C>(set2, set2, set2),
        testIterableConcat<C>(set1, set2, set1), testIterableConcat<C>(set2, set1, set1),
        testIterableConcat<B>(arrlist2, arrlist2, arrlist2), testIterableConcat<B>(arrlist2, arrlist1, arrlist1),
        testIterableConcat<B>(arrlist1, arrlist2, arrlist1)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
