/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

public func testIterableCollectHashMap<K, V>(itT1: Iterable<(K, V)>): Int64 where K <: Hashable & Equatable<K>,
    V <: Equatable<V> {
    var collectHashMapExpect = HashMap<K, V>()
    for (i in itT1) {
        collectHashMapExpect.add(i[0], i[1])
    }
    var collectHashMapActual = collectHashMap<K, V>(itT1)
    if (collectHashMapActual != collectHashMapExpect) {
        return 1
    }
    return 0
}
