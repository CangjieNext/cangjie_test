/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: firstLogic.cj
// EXEC: %compiler %cmp_opt %f firstLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1: Array<UInt32> = [8, 9, 10, 25, 18, 19, 120, 125]
    var arr2: Array<UInt64> = [8]
    var arr3 = Array<Bool>()
    var arrlist1 = ArrayList<UInt16>([8, 9, 10, 25, 18, 19, 120, 125])
    var arrlist2 = ArrayList<UInt8>([25])
    var arrlist3 = ArrayList<String>()
    var set1 = HashSet<Int32>([8, 9, 10, 25, 18, 19, 120, 125])
    var set2 = HashSet<Rune>([r'a', r'b'])
    var set3 = HashSet<Int8>()

    var cases01 = [testIterableFirst<UInt32>(arr1, Option<UInt32>.Some(arr1[0])),
        testIterableFirst<UInt64>(arr2, Option<UInt64>.Some(arr2[0])), testIterableFirst<Bool>(arr3, Option<Bool>.None),
        testIterableFirst<UInt16>(arrlist1, Option<UInt16>.Some(arrlist1[0])),
        testIterableFirst<UInt8>(arrlist2, Option<UInt8>.Some(arrlist2[0])),
        testIterableFirst<String>(arrlist3, Option<String>.None), testIterableFirst<Int32>(set1, Option<Int32>.Some(8)),
        testIterableFirst<Rune>(set2, Option<Rune>.Some(r'a')), testIterableFirst<Int8>(set3, Option<Int8>.None),
        testIterableFirst<UInt32>(arr1, Option<UInt32>.Some(arr1[0]))]
    var resultExpexct = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpexct) {
        return 1
    }
    return 0
}
