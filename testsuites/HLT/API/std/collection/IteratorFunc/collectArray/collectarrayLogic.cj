/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public func testIterableCollectArray<T>(itT1: Iterable<T>): Int64 where T <: Equatable<T> {
    var temp = ArrayList<T>()
    for (i in itT1) {
        temp.add(i)
    }
    var collectArrayExpect = temp.toArray()
    var collectArrayActual = collectArray<T>(itT1)
    if (collectArrayActual != collectArrayExpect) {
        return 1
    }
    return 0
}
