/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
public func testIterableFlattern<T, R>(itT: Iterable<T>, itR: Iterable<R>): Int64 where T <: Iterable<R> & Equatable<T> & ToString,
    R <: Equatable<R> & ToString {
    var flatternIterator: Iterator<R> = flatten<T, R>(itT)
    var arrActual = ArrayList<R>()
    var arrExpect = ArrayList<R>()
    for (i in flatternIterator) {
        arrActual.add(i)
    }
    for (i in itR) {
        arrExpect.add(i)
    }
    if (arrActual != arrExpect) {
        return 1
    }
    return 0
}
