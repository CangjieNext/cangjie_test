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
    var map1 = HashMap<Int64, String>([(1, "one"), (2, "two"), (3, "three")])
    var map2 = HashMap<Int32, Rune>([(1, r'1'), (2, r'2'), (3, r'3')])
    var map3 = HashMap<Int8, Float64>([(1, Float64(1)), (2, Float64(2)), (3, Float64(3))])
    var map4 = HashMap<Int16, Float32>([(1, Float32(1)), (2, Float32(2)), (3, Float32(3))])
    var map5 = HashMap<Float16, UInt8>()
    var map6 = HashMap<UInt8, UInt16>([(1, 1), (2, 2), (3, 3)])
    var map7 = HashMap<UInt32, UInt64>([(1, 1), (2, 2), (3, 3)])
    var map8 = HashMap<Int64, Bool>([(1, true), (2, false), (3, true)])
    var map9 = HashMap<Int64, ArrayList<Int16>>()
    let cases = [
        testIterableEnumerate<Int64, String>(map1),
        testIterableEnumerate<Int32, Rune>(map2),
        testIterableEnumerate<Int8, Float64>(map3),
        testIterableEnumerate<Int16, Float32>(map4),
        testIterableEnumerate<Float16, UInt8>(map5),
        testIterableEnumerate<UInt8, UInt16>(map6),
        testIterableEnumerate<UInt32, UInt64>(map7),
        testIterableEnumerate<Int64, Bool>(map8),
        testIterableEnumerate<Int64, ArrayList<Int16>>(map9)
    ]
    for (testcase in cases) {
        if (testcase != 0) {
            return 1
        }
    }
    return 0
}
/*
    The generated index iterator is verified by looping next() to obtain the next element of the iterator.
    By verifying that the index of the generated index iterator is in a one-to-one correspondence with the element of the iterator,
    the generated index iterator is correct.Returns 0 if exact, otherwise returns 1
    params:
    it: original two-dimensional sequence
 */
public func testIterableEnumerate<K, V>(it: HashMap<K, V>): Int64 where K <: Equatable<K> & Hashable, V <: Equatable<V> {
    var mapExpect: HashMap<K, V> = HashMap<K, V>(it)
    var resultIterableEnumerate: Iterator<(Int64, (K, V))> = enumerate<(K, V)>(it)
    var mapExpectIterator = mapExpect.iterator()
    for (i in 0..mapExpect.size) {
        var (indexNum, ele) = resultIterableEnumerate.next().getOrThrow()
        var eleExpect = mapExpectIterator.next().getOrThrow()
        if (indexNum != i || ele[0] != eleExpect[0] || ele[1] != eleExpect[1]) {
            return 1
        }
    }
    println(0)
    return 0
}
