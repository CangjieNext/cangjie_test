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

// TODO:
class A {
    public A(var a!: Int64 = 0) {
    }
}

extend A <: Countable<A> & Comparable<A> {
    public func next(right: Int64): A {
        A(a: (this.a + right))
    }

    public func position(): Int64 {
        this.a
    }

    public operator func >(that: A): Bool {
        this.a > that.a
    }
    public operator func <(that: A): Bool {
        this.a < that.a
    }
    public operator func >=(that: A): Bool {
        this.a >= that.a
    }
    public operator func <=(that: A): Bool {
        this.a <= that.a
    }
    public operator func ==(that: A): Bool {
        this.a == that.a
    }
    public operator func !=(that: A): Bool {
        this.a != that.a
    }
    public func compare(that: A): Ordering {
        match {
            case this > that => Ordering.GT
            case this < that => Ordering.LT
            case _ => Ordering.EQ
        }
    }
}

main(): Int64 {
    let a: Range<A>
    return 0;
}
