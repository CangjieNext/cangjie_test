/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_07_a06_01

  @Level:         1

  @Assertion: 9.7(6) 
             // The context contains the following types: Base, Sub, and Sub <: Base. 

              class F<X> {
                  static func foo<Y>(a: X, b: Y) {}   // foo1
                  static func foo<Z>(a: Sub, b: Z) {} // foo2
              }

              /* The functions that enter the candidate set are foo1 and partial instantiated
                  foo2: foo<Y>(a:Base, b: Y) and foo<Z>(a: Sub, b: Z) */
              var f = Foo<Base>.foo(Sub(), Base()) // foo2

              The calling expression is in the form of obj.f(A), where obj is an instance of a generic type
              instantiation type, that is, f is a non-static member function of a generic type.

              The type of the obj in the expression must be determined first, and then the set of candidate functions
              can be constructed based on the type of the obj. If the type of obj is an instantiated type, and the
              non-static member function f of the instantiated type is applicable with respect to A, the f is a 
              candidate.

              // The context contains the following types: Base, Sub, and Sub <: Base.

              class C<T, U>{
                  init (a: T, b: U) {}
                  func foo(a: T, b: U) {} // foo1
                  func foo(a: Base, b: U) {} // foo2
              }

              /* It is infered that the type of obj is C<Sub, Rune>. The functions that enter the candidate set are
                 instantiated foo1, foo2: foo(a:Sub, b:Rune) and foo(a: Base, b: Rune) */

              main() {
                  C(Sub(), 'a').foo(Sub(), 'a') // choose foo1
                  return 0
              }

  @Description: Check the example provided.

  @Mode: run

  @Negative: no

  @Issue: 0006304, 0006305
*/

import utils.assert.Assert

open class Base {}

open class Sub <: Base {}

class F<X> {
    static func foo<Y>(a: X, b: Y)   { return 1 } // foo1
    static func foo<Z>(a: Sub, b: Z) { return 2 } // foo2
}

class C<T, U> {
    init (a: T, b: U) {}
    func foo(a: T, b: U)    { return 1 } // foo1
    func foo(a: Base, b: U) { return 2 } // foo2
}

main() {
    var f = F<Base>.foo(Sub(), Base()) // foo2
    Assert.equals(2, f)
    
    var g = C(Sub(), 'a').foo(Sub(), 'a') // choose foo1
    Assert.equals(1, g)

    return 0
}

