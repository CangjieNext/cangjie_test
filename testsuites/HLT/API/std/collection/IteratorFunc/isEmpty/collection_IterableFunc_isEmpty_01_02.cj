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
    var arr1 = Array<A>()
    var arrlist1 = ArrayList<B>()
    var set1 = HashSet<C>()
    var map1 = HashMap<A, C>()

    var cases01 = [
        testIterableIsEmpty<A>(arr1, true),
        testIterableIsEmpty<B>(arrlist1, true),
        testIterableIsEmpty<C>(set1, true),
        testIterableIsEmpty<(A, C)>(map1, true)
    ]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        return 1
    }
    return 0
}
