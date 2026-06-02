/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a08_02

  @Level:         1

  @Assertion: 6.3.4.1(8)
              For example: Functions f and g in the class Base are generic functions.
              Since classes E and F meet the requirement that the type parameters
              of the redef function are looser than or the same as those functions
              in the super class, compilation is successful.
              If class D does not meet requirements then an error is reported during compilation.
              // C <: B <: A
              open class Base {
                static func f<T>(a: T): T where T <: B
                static func g<T>(): T where T <: B
              }
              class D <: Base {
                redef static func f<T>(a: T): T where T <: C {} // Error￿stricter constraint
                redef static func g<T>(): T where T <: C {} // Error￿stricter constraint
              }
              class E <: Base {
                redef static func f<T>(a: T): T where T <: A {} // OK, looser constraint
                redef static func g<T>(): T where T <: A {} // OK, looser constraint
              }
              class F <: Base {
                redef static func f<T>(a: T): T where T <: B {} // OK￿same constraint
                redef static func g<T>(): T where T <: B {} // OK￿same constraint
              }

  @Description: Check the first negative case from the example

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006458

*/

// C <: B <: A
open class A {}
open class B <: A {}
class C <: B {}

open class Base {
    static func f<T>(a: T): T where T <: B
    //static func g<T>(): T where T <: B
}

class D <: Base {
    redef static func f<T>(a: T): T where T <: C {} // Error￿stricter constraint
}

main() {
}