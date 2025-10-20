/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

type C1 = cla

var map_a: HashMap<cla, cla> = HashMap<C1, cla>([(cla(1), cla(2)), (cla(3), cla(4))])
var map_b: HashMap<cla, cla> = HashMap<cla, C1>([(cla(1), C1(2)), (cla(2), cla(4))])
var map_c: HashMap<C1, cla> = HashMap<C1, cla>([(cla(1), cla(3)), (cla(2), cla(4)), (cla(3), cla(3))])
var map_d: HashMap<cla, cla> = HashMap<C1, C1>([(cla(1), cla(1)), (cla(3), cla(1)), (cla(2), cla(1))])

main(): Int64 {
    var map_a: HashMap<C1, cla> = HashMap<C1, cla>([(C1(1), cla(2)), (cla(3), cla(4))])
    var map_b: HashMap<cla, C1> = HashMap<cla, C1>([(C1(1), C1(2)), (C1(2), cla(4))])
    var map_c: HashMap<C1, C1> = HashMap<cla, cla>([(cla(1), C1(3)), (cla(2), C1(4)), (C1(3), cla(3))])
    var map_d: HashMap<cla, C1> = HashMap<C1, cla>([(cla(1), C1(1)), (C1(3), cla(1)), (C1(2), C1(1))])
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
