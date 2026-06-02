/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

public func testIterableCollectArrayList<T>(itT1: Iterable<T>): Int64 where T <: Equatable<T> {
    var collectArrayListExpect = ArrayList<T>()
    for (i in itT1) {
        collectArrayListExpect.add(i)
    }
    var collectArrayListActual = collectArrayList<T>(itT1)
    if (collectArrayListActual != collectArrayListExpect) {
        return 1
    }
    return 0
}
