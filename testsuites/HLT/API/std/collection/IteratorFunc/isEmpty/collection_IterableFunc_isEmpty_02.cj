/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  isEmptyLogic.cj
// EXEC: %compiler %cmp_opt %f isEmptyLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1: Array<UInt32> = [8, 9, 10, 25, 18, 19, 120, 125]
    var arrlist1 = ArrayList<UInt16>([8, 9, 10, 25, 18, 19, 120, 125])
    var set1 = HashSet<Int32>([8, 9, 10, 25, 18, 19, 120, 125])
    var map1 = HashMap<Int8, Int64>([(1, 2), (3, 4), (5, 6)])
    var cases01 = [testIterableIsEmpty<UInt32>(arr1, false), testIterableIsEmpty<UInt16>(arrlist1, false),
        testIterableIsEmpty<Int32>(set1, false), testIterableIsEmpty<(Int8, Int64)>(map1, false)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        return 1
    }
    return 0
}
