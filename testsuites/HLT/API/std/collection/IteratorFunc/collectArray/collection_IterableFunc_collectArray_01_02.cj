/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj collectarrayLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj collectarrayLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1: Array<A> = [A(9), A(10), A(11), A(12)]
    var arr2 = Array<A>()
    var arrlist1 = ArrayList<B>([B(9), B(10), B(11), B(12)])
    var arrlist2 = ArrayList<C>()

    var set1 = HashSet<B>([B(9), B(10), B(11), B(12)])
    var set2 = HashSet<C>()
    var casesresult = [testIterableCollectArray<A>(arr1), testIterableCollectArray<A>(arr2),
        testIterableCollectArray<B>(arrlist1), testIterableCollectArray<C>(arrlist2), testIterableCollectArray<B>(set1),
        testIterableCollectArray<C>(set2)]
    var resultExpexct = Array<Int64>(casesresult.size, repeat: 0)
    if (casesresult != resultExpexct) {
        return 1
    }
    return 0
}
