// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f

import std.collection.*

open class A {
    let id: Int32
    var param: ArrayList<B> = ArrayList<B>()
    init() {
        id = 0
    }
    func isMA(a: A, b: A): Bool {
        return a == b
    }
}

extend A <: Equatable<A> & Hashable {
    operator func ==(rhs: A): Bool {
        this.id == rhs.id
    }
    operator func !=(rhs: A): Bool {
        this.id != rhs.id
    }
    func hashCode(): Int64 {
        Int64(this.id)
    }
}

class B <: A {
    operator func ==(rhs: B): Bool {
        this.id == rhs.id
    }
    operator func !=(rhs: B): Bool {
        this.id != rhs.id
    }

    init() {
    }
}

main() {
    0
}

/* SCAN
error: a deriving member must be at least as visible as its base member
  ==> equatable.cj:34:7:
   | 
34 | class B <: A {
   |       ^ '!=' is inherited
   | 
note: the deriving '!=' is defined here
  ==> equatable.cj:26:19:
   | 
26 |     operator func !=(rhs: A): Bool {
   |                   ^^ the visibility of the deriving '!=' is 'internal'
   | 
note: the visibility of the base '!=' is 'public'
  ==> (package std.core)equatable.cj:20:19:

1 error generated, 1 error printed.
*/
