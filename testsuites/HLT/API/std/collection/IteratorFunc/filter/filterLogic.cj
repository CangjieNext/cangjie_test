/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
public func testIterableFilter<T>(it: Iterable<T>, predicate: (T) -> Bool): Int64 where T <: Equatable<T> {
    var arraylistExpect: ArrayList<T> = ArrayList<T>()
    for (i in it) {
        if (predicate(i)) {
            arraylistExpect.add(i)
        }
    }
    var sizeOrigin = arraylistExpect.size
    var filterFunc = filter<T>(predicate)
    var filterIterator = filterFunc(it)

    if (arraylistExpect.size != sizeOrigin) {
        return 1
    }
    for (i in 0..arraylistExpect.size) {
        if (arraylistExpect[i] != filterIterator.next().getOrThrow()) {
            return 2
        }
    }
    return 0
}
