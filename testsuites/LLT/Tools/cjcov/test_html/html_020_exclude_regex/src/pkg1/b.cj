// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package default.pkg1

internal import std.collection.*

public func func2() {
    var set: HashSet<String> = HashSet<String>()
    set.add("lyq")
    set.add("zdx")
    set.add("lyk")
    set.add("lst")
    var itset = set.iterator()
    try {
        while (true) {
            var value = itset.next()
            match (value) {
                case Some(v) =>
                    if (!set.contains(v)) {
                        return
                    } else {
                        set.remove(v)
                    }
                case None => break
            }
        }
    } catch (e: Exception) {
        return
    }
    return
}
