/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    if (test() != 1) {
        return 1
    }
    return 0
}

func test() {
    var a: HashMap<Boo, Int64> = HashMap<Boo, Int64>(5, {x: Int64 => (Coo(x), 1)})
    var b = a.get(Coo(1))
    return match (b) {
        case Some(x) => x
        case None => 100
    }
}

class Coo <: Boo {
    public var y: Int64
    public init(x: Int64) {
        super(x)
        this.y = x
    }
}

var res: UInt64 = 0

open class Boo <: Hashable & Equatable<Boo> {
    public var x: Int64
    public init(x: Int64) {
        this.x = x
    }
    public func hashCode(): Int64 {
        res++
        return Int64(x)
    }
    public operator func ==(right: Boo): Bool {
        return this.x == right.x
    }
    public operator func !=(right: Boo): Bool {
        return false
    }
}
