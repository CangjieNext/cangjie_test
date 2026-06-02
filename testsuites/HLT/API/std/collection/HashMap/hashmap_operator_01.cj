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
    var a: HashMap<Coo, Int64> = HashMap<Coo, Int64>()
    var m = Coo(1)
    a[m] = 1
    a[m] += 1
    //    a[m] = a[m] + 1
    if (a[m] != 2) {
        return 1
    }
    return 0
}

var res: UInt64 = 0

class Coo <: Hashable & Equatable<Coo> {
    public var x: Int64
    public init(x: Int64) {
        this.x = x
    }
    public func hashCode(): Int64 {
        return Int64(x)
    }
    public operator func ==(right: Coo): Bool {
        var a = (this.x == right.x)
        if (a) {
            return true
        } else {
            return false
        }
    }
    public operator func !=(right: Coo): Bool {
        var a = (this.x == right.x)
        if (!a) {
            return true
        } else {
            return false
        }
    }
}
