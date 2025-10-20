/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

type C1 = cla<Int64>

func f1(a: HashMap<C1, UInt8>): HashMap<C1, UInt8> {
    var b = a
    var c = a
    a
}

main(): Int64 {
    var map_a: HashMap<C1, UInt8> = HashMap<C1, UInt8>([(cla(1), 42), (cla(2), 12)])
    f1(map_a)
    0
}

struct cla<T> <: Hashable & Equatable<cla<T>> {
    public var x: Int64
    public init(x: Int64) {
        this.x = x
    }
    public func hashCode(): Int64 {
        return Int64(x)
    }
    public operator func ==(right: cla<T>): Bool {
        return this.x == right.x
    }
    public operator func !=(right: cla<T>): Bool {
        var a = right
        return false
    }
}
