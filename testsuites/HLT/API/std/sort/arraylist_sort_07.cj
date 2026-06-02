/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*
import std.sort.SortExtension

class A <: Comparable<A> {
    var a: Int64
    public var b: Int64
    public init(a: Int64, b: Int64) {
        this.a = a
        this.b = b
    }
    public func compare(rhs: A): Ordering {
        match {
            case this < rhs => Ordering.LT
            case this > rhs => Ordering.GT
            case _ => Ordering.EQ
        }
    }
    public operator func ==(rhs: A): Bool {
        return this.a == rhs.a && this.b == rhs.b
    }
    public operator func !=(rhs: A): Bool {
        return this.a == rhs.a || this.b == rhs.b
    }
    public operator func <(rhs: A): Bool {
        return this.a < rhs.a && this.b < rhs.b
    }
    public operator func >(rhs: A): Bool {
        return this.a > rhs.a && this.b > rhs.b
    }
    public operator func <=(rhs: A): Bool {
        return this.a <= rhs.a && this.b <= rhs.b
    }
    public operator func >=(rhs: A): Bool {
        return this.a >= rhs.a && this.b >= rhs.b
    }
}

main(): Int64 {
    var a1 = ArrayList<A>([A(1, 1), A(0, 0)])
    var a2 = ArrayList<A>([A(1, 1), A(0, 0)])
    var a3 = ArrayList<A>([A(1, 1), A(0, 0)])
    a1.sort()
    a2.sort(stable: false)
    a3.sort(stable: true)
    if (a1[0].a != 0 || a1[0].b != 0 || a1[1].a != 1 || a1[1].b != 1) {
        return 1
    }
    if (a2[0].a != 0 || a2[0].b != 0 || a2[1].a != 1 || a2[1].b != 1) {
        return 3
    }
    if (a3[0].a != 0 || a3[0].b != 0 || a3[1].a != 1 || a3[1].b != 1) {
        return 3
    }
    return 0
}
