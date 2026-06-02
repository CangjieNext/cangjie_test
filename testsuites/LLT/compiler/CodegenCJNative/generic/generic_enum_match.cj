// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum Option<T> {
    None
    | Some(T)
}

class TreeMap<V> {
    public func putAll(a: V, b: V): V {
        let tmp = Option<V>.Some(a)
        var ans = match (tmp) {
            case None => b
            case Some(value) => value
        }
        return ans
    }
}

main() {
    var map = TreeMap<Int64>()
    return map.putAll(5, 3) - 5
}
