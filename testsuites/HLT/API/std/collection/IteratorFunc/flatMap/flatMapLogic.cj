/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
public func testIterableFlatMap<T, R>(itT: Iterable<T>, itR: Iterable<R>, transform: (T) -> Iterable<R>): Int64 where T <: Equatable<T> & ToString,
    R <: Equatable<R> & ToString {
    var flatMapFunc = flatMap<T, R>(transform)
    var flatMapResult = flatMapFunc(itT)
    var arrActual = ArrayList<R>()
    var arrExpect = ArrayList<R>()
    for (i in flatMapResult) {
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

var lamdaCharToChar = {
    it: ArrayList<Rune> =>
    var arrlist = ArrayList<Rune>()
    for (i in it) {
        arrlist.add(i)
    }
    return arrlist
}
var lamdaUInt8ToUInt64 = {
    it: HashSet<UInt8> =>
    var arrlist = ArrayList<UInt64>()
    for (i in it) {
        arrlist.add(UInt64(i))
    }
    return arrlist
}
var lamdaInt32ToString = {
    it: Array<Int32> =>
    var arrlist = ArrayList<String>()
    for (i in it) {
        arrlist.add(i.toString())
    }
    return arrlist
}
