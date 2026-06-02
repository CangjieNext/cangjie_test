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

import std.sort.*

struct A {
    A(var ra!: Int64 = 0, let rb!: Int64 = 0) {
    }
}

extend A <: Comparable<A> {
    public func compare(rhs: A): Ordering {
        match {
            case this < rhs => Ordering.LT
            case this > rhs => Ordering.GT
            case _ => Ordering.EQ
        }
    }
    public operator func ==(rhs: A): Bool {
        return this.ra == rhs.ra && this.rb == rhs.rb
    }
    public operator func !=(rhs: A): Bool {
        return this.ra == rhs.ra || this.rb == rhs.rb
    }
    public operator func <(rhs: A): Bool {
        return this.ra < rhs.ra && this.rb < rhs.rb
    }
    public operator func >(rhs: A): Bool {
        return this.ra > rhs.ra && this.rb > rhs.rb
    }
    public operator func <=(rhs: A): Bool {
        return this.ra <= rhs.ra && this.rb <= rhs.rb
    }
    public operator func >=(rhs: A): Bool {
        return this.ra >= rhs.ra && this.rb >= rhs.rb
    }
}

main(): Int64 {
    var a1: Array<A> = [A(ra: 2, rb: 2), A(ra: 0, rb: 0), A(ra: 1, rb: 1)]
    var a2: Array<A> = [A(ra: 2, rb: 2), A(ra: 0, rb: 0), A(ra: 1, rb: 1)]
    var a3: Array<A> = [A(ra: 2, rb: 2), A(ra: 0, rb: 0), A(ra: 1, rb: 1)]
    a1.sortDescending()
    a2.sortDescending(stable: false)
    a3.sortDescending(stable: true)
    if (a1[0].ra != 2 || a1[0].rb != 2 || a1[1].ra != 1 || a1[1].rb != 1 || a1[2].ra != 0 || a1[2].rb != 0) {
        return 1
    }
    if (a2[0].ra != 2 || a2[0].rb != 2 || a2[1].ra != 1 || a2[1].rb != 1 || a2[2].ra != 0 || a2[2].rb != 0) {
        return 2
    }
    if (a3[0].ra != 2 || a3[0].rb != 2 || a3[1].ra != 1 || a3[1].rb != 1 || a3[2].ra != 0 || a3[2].rb != 0) {
        return 3
    }
    return 0
}
