/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a12_01

  @Level:         1

  @Assertion: 6.2.4.1(12)
              When implementing an interface for a type other than an abstract class,
             the abstract functions and the abstract properties in the interfaces must be implemented,
             as the f1 in the following example. Allows not to use the default implementation of functions
             in the interface, as the f2 in the following example.
             The abstract class do not need to implement all instance member functions in interfaces.
             In the following example, the abstract class C1 does not implement f1 in the I interface.
             interface I {
               type Item
               func f1(): Unit
               func f2(): Unit {
                 return
               }
               static func f3(): Item
              }
              class C <: I {
                public type Item = C
                public func f1(): Unit {}
                public func f2(): Unit {
                  return
                }
                public static func f3(): C {
                  return C()
                }
              }
              abstract class C1 <: I {
                public type Item = C1
                public static func f3(): C1 {
                  return C1()
                }
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006415

*/

import utils.assert.Assert

interface I {
    func f1(): Unit
    func f2(): Unit {
        return
    }
    static func f3(): Int64
}
class C <: I {
    public func f1(): Unit {}
    public func f2(): Unit {
        return
    }
    public static func f3(): Int64 {
        return 0
    }
}

abstract class C1 <: I {
    public static func f3(): Int64 {
        return 1
    }
}

class TypeChecker<T> {}

main() {
    let c = C()
    Assert.isTrue(c is I)
    Assert.isTrue(c is C)

    let c1 = TypeChecker<C1>()
    Assert.isTrue(c1 is TypeChecker<C1>)
}
