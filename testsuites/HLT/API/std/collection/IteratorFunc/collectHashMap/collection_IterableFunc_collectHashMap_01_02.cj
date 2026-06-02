/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj collectHashMapLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj collectHashMapLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1: Array<(A, A)> = [(A(9), A(10)), (A(11), A(12))]
    var arr2 = Array<(A, A)>()
    var arr3: Array<(B, B)> = [(B(9), B(10)), (B(11), B(12))]
    var arr4 = Array<(B, B)>()
    var arr5: Array<(A, C)> = [(A(9), C(10)), (A(11), C(12))]
    var arr6 = Array<(A, C)>()

    var arrlist1 = ArrayList<(A, A)>([(A(9), A(10)), (A(11), A(12))])
    var arrlist2 = ArrayList<(A, A)>()
    var arrlist3 = ArrayList<(B, B)>([(B(9), B(10)), (B(11), B(12))])
    var arrlist4 = ArrayList<(B, B)>()
    var arrlist5 = ArrayList<(A, C)>([(A(9), C(10)), (A(11), C(12))])
    var arrlist6 = ArrayList<(A, C)>()

    var cases01 = [testIterableCollectHashMap<A, A>(arr1), testIterableCollectHashMap<A, A>(arr2),
        testIterableCollectHashMap<B, B>(arr3), testIterableCollectHashMap<B, B>(arr4),
        testIterableCollectHashMap<A, C>(arr5), testIterableCollectHashMap<A, C>(arr6),
        testIterableCollectHashMap<A, A>(arrlist1), testIterableCollectHashMap<A, A>(arrlist2),
        testIterableCollectHashMap<B, B>(arrlist3), testIterableCollectHashMap<B, B>(arrlist4),
        testIterableCollectHashMap<A, C>(arrlist5), testIterableCollectHashMap<A, C>(arrlist6)]

    var resultExpexct = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpexct) {
        return 1
    }
    return 0
}
