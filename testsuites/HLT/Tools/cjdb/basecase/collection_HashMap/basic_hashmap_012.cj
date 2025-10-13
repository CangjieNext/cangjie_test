import std.collection.*

type C1 = cla<Int64>

var map_a: HashMap<C1, UInt8> = HashMap<C1, UInt8>([(cla(1), 42), (C1(2), 12)])
var map_b: HashMap<C1, String> = HashMap<C1, String>([(C1(1), 'a'), (cla(2), 'b')])
var map_c: HashMap<C1, Float32> = HashMap<C1, Float32>([(cla(1), 17.750), (C1(2), 1.836), (C1(3), 3.594)])
var map_d: HashMap<C1, Rune> = HashMap<C1, Rune>([(cla(1), r'C'), (cla(3), r'a'), (cla(2), r'N')])

main(): Int64 {
    var map_a: HashMap<C1, UInt8> = HashMap<C1, UInt8>([(cla(1), 42), (C1(2), 12)])
    var map_b: HashMap<C1, String> = HashMap<C1, String>([(C1(1), 'a'), (cla(2), 'b')])
    var map_c: HashMap<C1, Float32> = HashMap<C1, Float32>([(cla(1), 17.750), (C1(2), 1.836), (C1(3), 3.594)])
    var map_d: HashMap<C1, Rune> = HashMap<C1, Rune>([(cla(1), r'C'), (cla(3), r'a'), (cla(2), r'N')])
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

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
