/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class testC1 {
    var map_a: HashMap<cla, UInt8> = HashMap<cla, UInt8>([(cla(1), 42), (cla(2), 12)])
    var map_b: HashMap<cla, String> = HashMap<cla, String>([(cla(1), 'a'), (cla(2), 'b')])
    var map_c: HashMap<cla, Float32> = HashMap<cla, Float32>([(cla(1), 17.750), (cla(2), 1.836), (cla(3), 3.594)])
    var map_d: HashMap<cla, Rune> = HashMap<cla, Rune>([(cla(1), r'C'), (cla(3), r'a'), (cla(2), r'N')])
}

main(): Int64 {
    var a1 = testC1()
    var a2 = a1.map_a
    var a3 = a1.map_b
    var a4 = a1.map_c
    var a5 = a1.map_d
    0
}

class cla <: Hashable & Equatable<cla> {
    public var x: Int64
    public init(x: Int64) {
        this.x = x
    }
    public func hashCode(): Int64 {
        return Int64(x)
    }
    public operator func ==(right: cla): Bool {
        return this.x == right.x
    }
    public operator func !=(right: cla): Bool {
        var a = right
        return false
    }
}
