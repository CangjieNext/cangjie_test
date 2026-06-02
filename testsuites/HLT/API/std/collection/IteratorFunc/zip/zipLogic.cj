/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
/*
   Invoke the zip() function to combine sequences itT and itR to generate a new sequence.
   The expected value of the new sequence is itExpect.
   params:
   itExpect: Expected sequence
 */
public func testIterableZip<T, R>(itT: Iterable<T>, itR: Iterable<R>, itExpect: Array<(T, R)>): Int64 where T <: Equatable<T>,
    R <: Equatable<R> {
    var zipFunc = zip<T, R>(itR)
    var zipResult = zipFunc(itT)
    var zipResultArray = collectArray<(T, R)>(zipResult)
    for (i in 0..itExpect.size) {
        var zipResultArrayTuple = zipResultArray[i]
        var itExpectArrayTuple = itExpect[i]
        if (zipResultArrayTuple[0] != itExpectArrayTuple[0] || zipResultArrayTuple[1] != itExpectArrayTuple[1]) {
            return 1
        }
    }
    return 0
}
