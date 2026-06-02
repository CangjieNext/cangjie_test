/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1: Array<UInt32> = [8, 9, 10, 25, 18, 19, 120, 125]
    var arr2: Array<UInt64> = [8]
    var arr3 = Array<Int8>()
    var arrlist1 = ArrayList<UInt16>([8, 9, 10, 25, 18, 19, 120, 125])
    var arrlist2 = ArrayList<UInt8>([25])
    var arrlist3 = ArrayList<String>()
    var set1 = HashSet<Int32>([8, 9, 10, 25, 18, 19, 120, 125])
    var set2 = HashSet<Rune>([r'a', r'b'])
    var set3 = HashSet<Int8>()

    var cases01 = [testIterableLast<UInt32>(arr1, Option<UInt32>.Some(arr1[arr1.size - 1])),
        testIterableLast<UInt64>(arr2, Option<UInt64>.Some(arr2[arr2.size - 1])),
        testIterableLast<Int8>(arr3, Option<Int8>.None),
        testIterableLast<UInt16>(arrlist1, Option<UInt16>.Some(arrlist1[arrlist1.size - 1])),
        testIterableLast<UInt8>(arrlist2, Option<UInt8>.Some(arrlist2[arrlist2.size - 1])),
        testIterableLast<String>(arrlist3, Option<String>.None), testIterableLast<Int32>(set1, Option<Int32>.Some(125)),
        testIterableLast<Rune>(set2, Option<Rune>.Some(r'b')), testIterableLast<Int8>(set3, Option<Int8>.None)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        return 1
    }
    return 0
}

public func testIterableLast<T>(itT1: Iterable<T>, elementLastExpect: Option<T>): Int64 where T <: Comparable<T> {
    var elementLastActual = last<T>(itT1)
    if (elementLastActual != elementLastExpect) {
        return 1
    }
    return 0
}
