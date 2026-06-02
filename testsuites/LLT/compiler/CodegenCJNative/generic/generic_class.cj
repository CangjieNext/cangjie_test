// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class MapNode<K, V> {
    private var key: K
    private var value: V
    public init(key: K, value: V) {
        this.key = key
        this.value = value
    }
}

class RuneMap<K, V> {
    public init() {}
    public func put(key: K, value: V) {
        var tmp = MapNode<K, V>(key, value)
        return 0
    }
}

main() {
    var map = RuneMap<Int32, Int32>()
    return map.put(1, 2)
}
