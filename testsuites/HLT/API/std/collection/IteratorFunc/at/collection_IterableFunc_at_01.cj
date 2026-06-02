/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: atLogic.cj
// EXEC: %compiler %cmp_opt %f atLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1: Array<UInt32> = [8, 9, 10, 25, 18, 19, 120, 125]
    var arr2 = Array<Rune>()
    var arrlist1 = ArrayList<UInt16>([8, 9, 10, 25, 18, 19, 120, 125])
    var arrlist2 = ArrayList<String>()
    var set1 = HashSet<Int32>([8, 9, 10, 25, 18, 19, 120, 125])
    var set2 = HashSet<Int8>()

    var cases01 = [testIterableAt<UInt32>(arr1, Int64.Min, Option<UInt32>.None),
        testIterableAt<UInt32>(arr1, -1, Option<UInt32>.None), testIterableAt<Rune>(arr2, Int64.Min, Option<Rune>.None),
        testIterableAt<Rune>(arr2, -1, Option<Rune>.None),
        testIterableAt<UInt16>(arrlist1, Int64.Min, Option<UInt16>.None),
        testIterableAt<UInt16>(arrlist1, -1, Option<UInt16>.None),
        testIterableAt<String>(arrlist2, Int64.Min, Option<String>.None),
        testIterableAt<String>(arrlist2, -1, Option<String>.None),
        testIterableAt<Int32>(set1, Int64.Min, Option<Int32>.None), testIterableAt<Int32>(set1, -1, Option<Int32>.None),
        testIterableAt<Int8>(set2, Int64.Min, Option<Int8>.None), testIterableAt<Int8>(set2, -1, Option<Int8>.None)]
    var resultExpexct = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpexct) {
        return 1
    }
    return 0
}
