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
    var a: HashMap<Coo<Int32, Int64>, Int64> = HashMap<Coo<Int32, Int64>, Int64>(5,
        {x: Int64 => (Coo<Int32, Int64>(x), 1)})
    var b = a.get(Coo<Int32, Int64>(1))
    return match (b) {
        case Some(x) => x
        case None => 100
    }
}

var res: UInt64 = 0

class Coo<K, V> <: Hashable & Equatable<Coo<K, V>> {
    public var x: Int64
    public init(x: Int64) {
        this.x = x
    }
    public func hashCode(): Int64 {
        res++
        return Int64(x)
    }
    public operator func ==(right: Coo<K, V>): Bool {
        return true
    }
    public operator func !=(right: Coo<K, V>): Bool {
        return false
    }
}
