/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

class testC1 {
    var map_a: HashMap<cla, cla> = HashMap<cla, cla>([(cla(1), cla(1)), (cla(2), cla(1))])
    var map_b: HashMap<cla, cla> = HashMap<cla, cla>([(cla(1), cla(0)), (cla(2), cla(2))])
    var map_c: HashMap<cla, cla> = HashMap<cla, cla>([(cla(1), cla(9)), (cla(2), cla(2)), (cla(3), cla(2))])
    var map_d: HashMap<cla, cla> = HashMap<cla, cla>([(cla(1), cla(2)), (cla(3), cla(2)), (cla(2), cla(2))])
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
