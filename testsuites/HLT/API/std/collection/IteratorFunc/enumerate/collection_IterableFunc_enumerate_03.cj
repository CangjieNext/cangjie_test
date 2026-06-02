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

main(): Int64 {
    var complex1: Array<Array<UInt16>> = [[UInt16(8)]]
    var complex2: Array<Array<UInt16>> = [[UInt16(9)]]
    var complex3: Array<Array<UInt16>> = [[UInt16(10)]]
    var complex4: Array<Array<UInt16>> = [[UInt16(25)]]
    var complexType1: Array<Array<Array<UInt16>>> = [complex1, complex2, complex3, complex4]

    var complex5: Array<HashSet<UInt64>> = [HashSet<UInt64>([UInt64(8)])]
    var complex6: Array<HashSet<UInt64>> = [HashSet<UInt64>([UInt64(9)])]
    var complex7: Array<HashSet<UInt64>> = [HashSet<UInt64>([UInt64(10)])]
    var complex8: Array<HashSet<UInt64>> = [HashSet<UInt64>([UInt64(25)])]

    var complexType2 = ArrayList<Array<HashSet<UInt64>>>([complex5, complex6, complex7, complex8])
    var complexType3 = ArrayList<ArrayList<Array<HashSet<UInt64>>>>()
    var complexType4 = Array<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>()

    var cases = [
        testIterableEnumerate<Array<Array<UInt16>>>(complexType1),
        testIterableEnumerate<Array<HashSet<UInt64>>>(complexType2),
        testIterableEnumerate<ArrayList<Array<HashSet<UInt64>>>>(complexType3),
        testIterableEnumerate<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>(
            complexType4)
    ]
    for (testcase in cases) {
        if (testcase != 0) {
            return 1
        }
    }
    return 0
}

public func testIterableEnumerate<T>(it: Iterable<T>): Int64 where T <: Equatable<T> {
    var arraylistExpect: ArrayList<T> = ArrayList<T>()
    for (i in it) {
        arraylistExpect.add(i)
    }
    var resultIterableEnumerate: Iterator<(Int64, T)> = enumerate<T>(it)
    for (i in 0..arraylistExpect.size) {
        let (indexNum, ele) = resultIterableEnumerate.next().getOrThrow()
        if (indexNum != i || ele != arraylistExpect[i]) {
            return 1
        }
    }
    return 0
}
