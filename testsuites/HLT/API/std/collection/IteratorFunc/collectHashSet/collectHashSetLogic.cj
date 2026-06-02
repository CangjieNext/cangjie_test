/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

public func testIterableCollectHashSet<T>(itT1: Iterable<T>): Int64 where T <: Hashable & Equatable<T> {
    var collectHashSetExpect = HashSet<T>()
    for (i in itT1) {
        collectHashSetExpect.add(i)
    }
    var collectHashSetActual = collectHashSet<T>(itT1)
    if (collectHashSetActual != collectHashSetExpect) {
        return 1
    }
    return 0
}
