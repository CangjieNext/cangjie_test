/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a06_01

  @Level:         1

  @Assertion: 6.1.1.3(6)
              Also, interfaces can be generically defined and legal type arguments
              need to be provided when a generic interface is implemented.

  @Description: Check that a generic interfaces with legal type arguments can be implemented by a class

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface gi1<T> {}
interface gi2<T, U> {}

interface ci1<T1, T2, T3> {}
interface ci2<T1, T2, T3, T4> {}

// Case #1: Check instantiation of interfacese with concrete types
class A <: gi1<Int32> {}
class B <: gi1<Float32> & gi2<Bool, Bool> {}

// Case #2: Check instantiation of interfaces with concrete types that should satisfy constraints
class C <: ci1<B, gi1<Float32>, gi2<Bool, Bool>> {}
class D <: ci1<B, Object, Any> & ci2<A, gi1<Int32>, A, Object> {}

// Case #3: Check instationation of interfaces with generic types
class E<T> <: gi1<T> {}
class F<T> <: gi1<T> & gi2<T, T> {}

// Case #4: Check instationation of interfaces with generic types that should satisfy constraints
class G<X, Y, Z> <: ci1<X, Y, Z> {}
class H<T1, T2, T3, T4> <: ci1<T1, T2, T4> & ci2<T1, T2, T3, T4> {}

main() {
  var c1 = A()
  Assert.isTrue(c1 is A)
  Assert.isTrue(c1 is gi1<Int32>)

  var c2 = B()
  Assert.isTrue(c2 is B)
  Assert.isTrue(c2 is gi1<Float32>)
  Assert.isTrue(c2 is gi2<Bool, Bool>)

  var c3 = C()
  Assert.isTrue(c3 is C)
  Assert.isTrue(c3 is ci1<B, gi1<Float32>, gi2<Bool, Bool>>)

  var c4 = D()
  Assert.isTrue(c4 is D)
  Assert.isTrue(c4 is ci1<B, Object, Any>)
  Assert.isTrue(c4 is ci2<A, gi1<Int32>, A, Object>)

  var c5 = E<String>()
  Assert.isTrue(c5 is E<String>)
  Assert.isTrue(c5 is gi1<String>)

  var c6 = F<Rune>()
  Assert.isTrue(c6 is F<Rune>)
  Assert.isTrue(c6 is gi1<Rune>)
  Assert.isTrue(c6 is gi2<Rune, Rune>)

  var c7 = G<B, Object, Any>()
  Assert.isTrue(c7 is G<B, Object, Any>)
  Assert.isTrue(c7 is ci1<B, Object, Any>)

  var c8 = H<Box<Rune>, Object, gi1<Bool>, Any>()
  Assert.isTrue(c8 is H<Box<Rune>, Object, gi1<Bool>, Any>)
  Assert.isTrue(c8 is ci1<Box<Rune>, Object, Any>)
  Assert.isTrue(c8 is ci2<Box<Rune>, Object, gi1<Bool>, Any>)
}
