import std.collection.*

type B1 = cla

type B2 = str

type BB1 = B1

type BB2 = B2

main() {
    var map_main_1: HashMap<Rune, B1> = HashMap<Rune, BB1>([(r'K', cla(10)), (r'Q', cla(12))])
    var map_main_2: HashMap<Bool, BB1> = HashMap<Bool, BB1>([(true, cla(4)), (true, cla(4)), (true, cla(6))])
    var map_main_3: HashMap<Rune, B2> = HashMap<Rune, str>([(r'K', str(10)), (r'Q', str(12))])
    var map_main_4: HashMap<Bool, str> = HashMap<Bool, BB2>([(true, str(4)), (true, str(4)), (true, str(6))])
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

struct str <: Hashable & Equatable<str> {
    public var x: Int64
    public init(x: Int64) {
        this.x = x
    }
    public func hashCode(): Int64 {
        return Int64(x)
    }
    public operator func ==(right: str): Bool {
        return this.x == right.x
    }
    public operator func !=(right: str): Bool {
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
