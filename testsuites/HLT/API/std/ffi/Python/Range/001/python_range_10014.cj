/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT: scan slice(1, 10, 1)

import std.ffi.python.*
import std.log.*
import std.collection.*

var x = Python.load()

class A {
    var a: Int64
    init(x: Int64) {
        a = x
    }
}

extend A <: Countable<A> {
    public func next(r: Int64): A {
        this.a += 1
        return this
    }
    public func position(): Int64 {
        return this.a
    }
}

extend A <: Comparable<A> {
    public func compare(rhs: A): Ordering {
        match {
            case this.a < rhs.a => Ordering.LT
            case this.a > rhs.a => Ordering.GT
            case _ => Ordering.EQ
        }
    }
    public operator func <(rhs: A): Bool {
        this.a < rhs.a
    }
    public operator func <=(rhs: A): Bool {
        this.a <= rhs.a
    }
    public operator func >(rhs: A): Bool {
        this.a > rhs.a
    }
    public operator func >=(rhs: A): Bool {
        this.a >= rhs.a
    }
}

extend A <: Equatable<A> {
    public operator func ==(rhs: A): Bool {
        this.a == rhs.a
    }
    public operator func !=(rhs: A): Bool {
        this.a != rhs.a
    }
}

extend A <: CjObj {
    public func toPyObj(): PyObj {
        return this.a.toPyObj()
    }
}

main(): Int64 {
    var i: Range<A> = A(1)..A(10)
    var a = PySlice(i)
    println(a)
    return 0
}
