/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj countLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj countLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1 = Array<A>()
    var arrlist1 = ArrayList<B>()
    var set1 = HashSet<C>()
    var map1 = HashMap<A, C>()

    var cases01 = [
        testIterableCount<A>(arr1, 0),
        testIterableCount<B>(arrlist1, 0),
        testIterableCount<C>(set1, 0),
        testIterableCount<(A, C)>(map1, 0)
    ]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
