/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_05_a06_01

  @Level:         1

  @Assertion: 9.3.5(6) Note that although constraints on upper bounds in the current declaration are introduced 
              implicitly, the current declaration can still write these constraints out explicitly.

  @Description: Check explicit introduced constraints declaration.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert


interface Eq<T> { 
    func eq(other: T): Bool 
}

interface Ord<T> where T <: Eq<T> { 
    func lt(other: T): Bool 
} 

// Eq<T> is explicitly enumerated as constraint, while it is being introduced implicitly via Ord<T>.
func foo<T>(a: T) where T <: Eq<T> & Ord<T> { 
    a.eq(a) 
    a.lt(a) 
}

class Number <: Eq<Number> & Ord<Number> {
    init(arg: Int64) {
        value = arg
    }

    public func eq(other: Number): Bool {
        return value == other.value
    }

    public func lt(other: Number): Bool {
        return value < other.value
    }

    func get() {
        return value
    }

    var value: Int64
}

main() {
    var n1 = Number(42)
    var n2 = Number(35)
    Assert.isTrue(n2.lt(n1))
    Assert.isFalse(n1.eq(n2))
    Assert.isFalse(foo<Number>(n1))
}

