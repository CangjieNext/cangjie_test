/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a13_01

  @Level:         1

  @Assertion: 6.2.4.1(13)
              For example: Functions f and g in the interface I are generic functions.
              Since classes E and F meet the requirement that the type parameters
              of the implemented function are looser than or the same as those 
              functions in the interface, compilation is successful.
              But class D does not meet requirements, an error is reported during compilation.
              // C <: B <: A
              interface I {
                static func f<T>(a: T): T where T <: B
                static func g<T>(): T where T <: B
              }
              class D <: I {
                public static func f<T>(a: T): T where T <: C {} // Error￿stricter constraint
                public static func g<T>(): T where T <: C {} // Error￿stricter constraint
              }
              class E <: I {
                public static func f<T>(a: T): T where T <: A {} // OK, looser constraint
                public static func g<T>(): T where T <: A {} // OK, looser constraint
              }
              class F <: I {
                public static func f<T>(a: T): T where T <: B {} // OK￿same constraint
                public static func g<T>(): T where T <: B {} // OK￿same constraint
              }

  @Description: Check that the example without erroneous lines works correctly

  @Mode: compileonly

  @Negative: no

  @Structure: single

  @Issue: 0006416

*/

import utils.assert.Assert

open class A {}
open class B <: A {}

// C <: B <: A
interface I {
    static func f<T>(a: T): Unit where T <: B
    static func g<T>(): Unit where T <: B
}

class E <: I {
    public static func f<T>(a: T): Unit where T <: A {} // OK, looser constraint
    public static func g<T>(): Unit where T <: A {} // OK, looser constraint
}
class F <: I {
    public static func f<T>(a: T): Unit where T <: B {} // OK￿same constraint
    public static func g<T>(): Unit where T <: B {} // OK￿same constraint
}

main() {
}