/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
/*
   The sequence itT1 skips the first count elements. The expected result is obtained by using the index segment in the original sequence.
   params:
   count: Number of top counts of elements to be skipped
   itLength: the size of itT1
   itT1: target Iterable<T>
 */
public func testIterableSkip<T>(itT1: Iterable<T>, count: Int64, itLength: Int64): Int64 where T <: Equatable<T> {
    var skipFunc = skip<T>(count)
    var itT1Result = skipFunc(itT1)
    var arrActual = ArrayList<T>()
    var arrExpectOrigin = ArrayList<T>()
    for (i in itT1Result) {
        arrActual.add(i)
    }
    for (i in itT1) {
        arrExpectOrigin.add(i)
    }
    var indexFinal = count
    var arrExpect: ArrayList<T> = ArrayList<T>()
    if (0 < count && count < itLength) {
        arrExpect = arrExpectOrigin[count..itLength]
    }
    if (count == 0) {
        arrExpect = arrExpectOrigin
    }
    if (arrActual != arrExpect) {
        return 1
    }
    return 0
}
/*
If the input parameter count of skip() is less than 0, an exception is thrown.
 */
public func testIterableExceptionSkip<T>(itT1: Iterable<T>, count: Int64): Int64 where T <: Equatable<T> {
    var skipFunc = skip<T>(count)
    try {
        var itT1Result: Iterator<T> = skipFunc(itT1)
    } catch (e: IllegalArgumentException) {
        return 0
    }
    return 1
}
