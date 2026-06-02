// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

internal import std.collection.HashMap

public class A <: ToString {
    A(var v: String) {}
    public func toString(): String {
        v
    }
}

public interface I {
    func toA(): A
}

extend String <: I {
    public func toA(): A {
        return A(this)
    }
}

public type MapA = HashMap<String, Any>

public func mapToA(map: MapA): Array<A> {
    var arr = Array<A>(map.size, repeat: A(""))
    var i = 0
    for ((k, v) in map) {
        if (v is I) {
            arr[i] = (v as I).getOrThrow().toA()
        }
        i += 1
    }
    return arr
}
