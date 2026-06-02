/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_05_a03_01

  @Level:         1

  @Assertion: 9.3.5(3) For example: 

              interface Eq<T> { 
                  func eq(other: T): Bool 
              }

              interface Ord<T> where T <: Eq<T> { 
                  func lt(other: T): Bool 
              } 

              func foo<T>(a: T) where T <: Ord<T> { 
                  a.eq(a) 
                  a.lt(a) 
              } 

              In foo function, even though only T <: Ord constraint is declared, the T type in Ord is constrained by
              Eq. Therefore, eq function can be called in function foo and the actual constraints here are
              T <: Eq & Ord.

  @Description: Check the example provided.

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

func foo<T>(a: T) where T <: Ord<T> { 
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

