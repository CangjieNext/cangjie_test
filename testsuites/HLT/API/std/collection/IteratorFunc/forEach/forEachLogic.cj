/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
/*
   Operate the sequence of itT2 with elements of itT1.
 */
public func testIterableForeach<T>(itT1: Iterable<T>, itT2: ArrayList<T>): Int64 where T <: Equatable<T> {
    var itT1Actual = ArrayList<T>()
    for (i in itT1) {
        itT1Actual.add(i)
    }
    var foreachFunc = forEach<T>({item: T => itT2.add(item)})
    foreachFunc(itT1)
    if (itT2 != itT1Actual) {
        return 1
    }
    return 0
}
