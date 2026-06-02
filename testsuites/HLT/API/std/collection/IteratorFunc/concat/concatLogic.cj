/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
public func testIterableConcat<T>(itT1: Iterable<T>, itT2: Iterable<T>, itT3: Iterable<T>): Int64 where T <: Equatable<T> {
    var concatFunc = concat<T>(itT1)
    var itT3Result = concatFunc(itT2)
    var arrActual = ArrayList<T>()
    var arrExpect = ArrayList<T>()
    for (i in itT3Result) {
        arrActual.add(i)
    }
    for (i in itT3) {
        arrExpect.add(i)
    }
    if (arrActual != arrExpect) {
        return 1
    }
    return 0
}

public func testIterableConcat<T, V>(itT1: Iterable<(T, V)>, itT2: Iterable<(T, V)>, itT3: Iterable<(T, V)>): Int64 where T <: Equatable<T>,
    V <: Equatable<V> {
    var concatFunc = concat<(T, V)>(itT1)
    var itT3Result = concatFunc(itT2)
    var arrActual = ArrayList<(T, V)>()
    var arrExpect = ArrayList<(T, V)>()
    for (i in itT3Result) {
        arrActual.add(i)
    }
    for (i in itT3) {
        arrExpect.add(i)
    }
    for (i in 0..arrActual.size) {
        if (arrActual[i][0] != arrExpect[i][0] || arrActual[i][1] != arrExpect[i][1]) {
            return 1
        }
    }
    return 0
}
