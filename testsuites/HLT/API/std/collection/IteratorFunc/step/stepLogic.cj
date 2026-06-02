/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
/*
When the value of step is greater than 0, the sequence is skipped normally and the expected sequence of the slice is obtained by using the slice function of ArrayList.
 */
public func testIterableStep<T>(itT1: Iterable<T>, count: Int64): Int64 where T <: Equatable<T> {
    var stepFunc = step<T>(count)
    var itT1Result = stepFunc(itT1)
    var arrActual = ArrayList<T>()
    var arrExpectOrigin = ArrayList<T>()
    var arrExpect = ArrayList<T>()
    for (i in itT1Result) {
        arrActual.add(i)
    }
    for (i in itT1) {
        arrExpectOrigin.add(i)
    }
    for (i in 0..arrExpectOrigin.size : count) {
        arrExpect.add(arrExpectOrigin[i])
    }
    if (arrActual != arrExpect) {
        return 1
    }
    return 0
}
/*
  The step() function throws an exception when the number of sequences is less than or equal to 0.
 */
public func testIterableExceptionStep<T>(itT1: Iterable<T>, count: Int64): Int64 where T <: Equatable<T> {
    var stepFunc = step<T>(count)
    try {
        var itT1Result = stepFunc(itT1)
    } catch (e: IllegalArgumentException) {
        return 0
    }
    return 1
}
