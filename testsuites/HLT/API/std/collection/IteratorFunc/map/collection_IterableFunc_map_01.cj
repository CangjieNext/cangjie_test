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
    var arr1: Array<Int8> = [8, 9, 10, 25]
    var arr2 = Array<Float16>()
    var set1 = HashSet<UInt8>([8, 9, 10, 25])
    var set2 = HashSet<UInt16>()
    var arraylist1 = ArrayList<Int16>([8, 9, 10, 25])
    var arraylist2 = ArrayList<Int32>()
    var cases01 = [
        testIterableMap<Int8, Int64>(arr1, {a: Int8 => Int64(a)}),
        testIterableMap<Float16, Float64>(arr2, {a: Float16 => Float64(a)}),
        testIterableMap<UInt8, UInt16>(set1, {a: UInt8 => UInt16(a)}),
        testIterableMap<UInt16, UInt16>(set2, {a: UInt16 => UInt16(a)}),
        testIterableMap<Int16, Int64>(arraylist1, {a: Int16 => Int64(a)}),
        testIterableMap<Int32, Int64>(arraylist2, {a: Int32 => Int64(a)})
    ]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (resultExpect != cases01) {
        return 1
    }
    return 0
}
/*
    Save the mapped train columns to ArrayList and use the ArrayList feature to verify that the actual result is consistent with the expected error. If the verification is successful, 0 is returned. Otherwise, 1 or 2 is returned.
    The length and content of the generated sequence are the same as the expected sequence.
 */
public func testIterableMap<T, R>(it: Iterable<T>, transform: (T) -> R): Int64 where T <: Equatable<T> & ToString,
    R <: Equatable<R> & ToString {
    var mapExpect: ArrayList<T> = ArrayList<T>()
    for (i in it) {
        mapExpect.add(i)
    }
    var sizeOrigin = mapExpect.size
    var mapFunc = map<T, R>(transform)
    var mapResult = mapFunc(it)
    var mapActual = ArrayList<R>()
    for (i in mapResult) {
        if (i is R) {
            mapActual.add(i)
        }
    }
    if (mapExpect.size != sizeOrigin) {
        return 1
    }
    if (mapActual.toString() != mapExpect.toString()) {
        return 2
    }
    return 0
}
