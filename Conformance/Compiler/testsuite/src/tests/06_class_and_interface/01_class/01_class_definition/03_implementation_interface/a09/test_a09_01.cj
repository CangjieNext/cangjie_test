/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a09_01

  @Level:         1

  @Assertion: 6.1.1.3(9)
              When implementing a generic interface, it cannot be directly implemented multiple times 
              with the same type arguments

  @Description: Check that a generic interface can be indirecly implemented several times with the same type arguments

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

// Indirect implementation through interfaces
interface I1<T> {}
interface I2<U> <: I1<U> {}
interface I3<V> <: I2<V> {}

class A <: I1<Bool> & I2<Bool> & I3<Bool> {}

// Indirect implementation through a superclass
interface I<T1, T2> {}
open class B <: I<String, Rune> {}
class C <: B & I<String, Rune> {}

// Indirect implementation through both superclass and interfaces
interface Triple<T> {}
interface Double<T> <: Triple<T> {}
interface Once<T> <: Double<T> {}
open class D <: Triple<Unit> {}
class E <: D & Triple<Unit> & Double<Unit> & Once<Unit> {}

// Indirect implementation through interfaces for a generic class
interface FG1<T> {}
interface FG2<T> <: FG1<T> {}
interface FG3<T> <: FG2<T> {}

class GA<T> <: FG1<T> & FG2<T> & FG3<T> {}

// Indirect implementation through a superclass for a generic class
interface FG<T1, T2> {}
open class GB<T> <: FG<T, T> {}
class GC<T> <: GB<T> & FG<T, T> {}

// Indirect implementation through both superclass and interfaces for a generic class
interface GTriple<T1, T2, T3> {}
interface GDouble<T, U> <: GTriple<T, T, U> {}
interface GOnce<T> <: GDouble<T, T> {}
open class GD <: GTriple<Int64, Int64, Int64> {}
class GE<T1, T2> <: GD & GTriple<T1, T1, T1> & GDouble<T1, T1> & GOnce<T1> {}

main() {
  var a = A()
  Assert.isTrue(a is A)
  Assert.isTrue(a is I1<Bool>)
  Assert.isTrue(a is I2<Bool>)
  Assert.isTrue(a is I3<Bool>)

  var c = C()
  Assert.isTrue(c is C)
  Assert.isTrue(c is I<String, Rune>)

  var e = E()
  Assert.isTrue(e is E)
  Assert.isTrue(e is Triple<Unit>)
  Assert.isTrue(e is Double<Unit>)
  Assert.isTrue(e is Once<Unit>)

  var ga = GA<Object>()
  Assert.isTrue(ga is GA<Object>)
  Assert.isTrue(ga is FG1<Object>)
  Assert.isTrue(ga is FG2<Object>)
  Assert.isTrue(ga is FG3<Object>)

  var gc = GC<()->Int32>()
  Assert.isTrue(gc is GC<()->Int32>)
  Assert.isTrue(gc is FG<()->Int32, ()->Int32>)

  var ge = GE<Int64, Int32>()
  Assert.isTrue(ge is GE<Int64, Int32>)
  Assert.isTrue(ge is GTriple<Int64, Int64, Int64>)
  Assert.isTrue(ge is GDouble<Int64, Int64>)
  Assert.isTrue(ge is GOnce<Int64>)
}
