/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a09_02

  @Level:         1

  @Assertion: 6.1.1.3(9)
              When implementing a generic interface, it cannot be directly implemented multiple times 
              with the same type arguments

  @Description: Check that a generic interface can be implemented several times with different type arguments

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

// Direct implementation
interface Same<T> {}

class A <: Same<Bool> & Same<Rune> & Same<Object> & Same<Any> {}

// Direct implementation with inheritance
interface SameWithSuperClass<T1, T2> {}
open class P {}

class B <: P & SameWithSuperClass<Bool, Bool> & SameWithSuperClass<Bool, Rune> & 
           SameWithSuperClass<Rune, Bool> & SameWithSuperClass<Rune, Rune> {}

// Indirect implementation through interfaces
interface I1<T> {}
interface I2<T> <: I1<T> {}
interface I3<T> <: I2<T> {}

class C <: I1<Unit> & I2<Bool> & I3<Object> {}

// Indirect implementation through a superclass
interface II<T1, T2> {}
open class ImP <: II<Rune, String> {}

class D <: ImP & II<String, Rune> {}

// Indirect implementation through both superclass and interfaces
interface Triple<T> {}
interface Double<T> <: Triple<T> {}
interface Once<T> <: Double<T> {}
open class TripleP <: Triple<A> {}

class E <: TripleP & Triple<B> & Double<C> & Once<D> {}

// Direct implementation for a generic class
interface SameForG<T> {}

class F<T1, T2> <: SameForG<T1> & SameForG<Rune> & SameForG<Object> & SameForG<T2> {}

// Direct implementation with inheritance for a generic class
interface DoubleParam<T1, T2> {}
open class GP {}

class G<T> <: GP & DoubleParam<Bool, Bool> & DoubleParam<Bool, Rune> & 
           DoubleParam<Rune, Bool> & DoubleParam<Rune, Rune> {}

// Indirect implementation through interfaces for a generic class
interface FG1<T> {}
interface FG2<T> <: FG1<T> {}
interface FG3<T> <: FG2<T> {}

class H<T> <: FG1<Int32> & FG2<T> & FG3<Float32> {}

// Indirect implementation through a superclass for a generic class
interface FG<T1, T2> {}
open class GB<T> <: FG<T, Any> {}

class I<T> <: GB<T> & FG<T, T> {}

// Indirect implementation through both superclass and interfaces for a generic class
interface GTriple<T1, T2, T3> {}
interface GDouble<T, U> <: GTriple<T, T, U> {}
interface GOnce<T> <: GDouble<Object, Option<Object>> {}
open class GD <: GTriple<Int64, Int64, Int64> {}

class J<T1, T2> <: GD & GTriple<T2, T2, T2> & GDouble<T1, T2> & GOnce<T2> {}

main() {
  var a = A()
  Assert.isTrue(a is A)
  Assert.isTrue(a is Same<Bool>)
  Assert.isTrue(a is Same<Rune>)
  Assert.isTrue(a is Same<Object>)
  Assert.isTrue(a is Same<Any>)

  var b = B()
  Assert.isTrue(b is B)
  Assert.isTrue(b is SameWithSuperClass<Bool, Bool>)
  Assert.isTrue(b is SameWithSuperClass<Bool, Rune>)
  Assert.isTrue(b is SameWithSuperClass<Rune, Bool>)
  Assert.isTrue(b is SameWithSuperClass<Rune, Rune>)

  var c = C()
  Assert.isTrue(c is C)
  Assert.isTrue(c is I1<Unit>)
  Assert.isTrue(c is I1<Bool>)
  Assert.isTrue(c is I1<Object>)
  Assert.isTrue(c is I2<Bool>)
  Assert.isTrue(c is I2<Object>)
  Assert.isTrue(c is I3<Object>)

  var d = D()
  Assert.isTrue(d is D)
  Assert.isTrue(d is II<String, Rune>)
  Assert.isTrue(d is II<Rune, String>)

  var e = E()
  Assert.isTrue(e is E)
  Assert.isTrue(e is Triple<A>)
  Assert.isTrue(e is Triple<B>)
  Assert.isTrue(e is Triple<C>)
  Assert.isTrue(e is Triple<D>)
  Assert.isTrue(e is Double<C>)
  Assert.isTrue(e is Double<D>)
  Assert.isTrue(e is Once<D>)

  var f = F<Int32, Int64>()
  Assert.isTrue(f is F<Int32, Int64>)
  Assert.isTrue(f is SameForG<Object>)
  Assert.isTrue(f is SameForG<Rune>)
  Assert.isTrue(f is SameForG<Int32>)
  Assert.isTrue(f is SameForG<Int64>)

  var g = G<()->Int32>()
  Assert.isTrue(g is G<()->Int32>)
  Assert.isTrue(g is DoubleParam<Bool, Bool>)
  Assert.isTrue(g is DoubleParam<Bool, Rune>)
  Assert.isTrue(g is DoubleParam<Rune, Bool>)
  Assert.isTrue(g is DoubleParam<Rune, Rune>)

  var h = H<(Rune, Rune)>()
  Assert.isTrue(h is H<(Rune, Rune)>)
  Assert.isTrue(h is FG1<Int32>)
  Assert.isTrue(h is FG1<Float32>)
  Assert.isTrue(h is FG1<(Rune, Rune)>)
  Assert.isTrue(h is FG2<Float32>)
  Assert.isTrue(h is FG2<(Rune, Rune)>)
  Assert.isTrue(h is FG3<Float32>)

  var i = I<Int32>()
  Assert.isTrue(i is I<Int32>)
  Assert.isTrue(i is FG<Int32, Int32>)
  Assert.isTrue(i is FG<Int32, Any>)

  var j = J<Rune, String>()
  Assert.isTrue(j is J<Rune, String>)
  Assert.isTrue(j is GTriple<Int64, Int64, Int64>)
  Assert.isTrue(j is GTriple<String, String, String>)
  Assert.isTrue(j is GTriple<Rune, Rune, String>)
  Assert.isTrue(j is GTriple<Object, Object, Option<Object>>)
  Assert.isTrue(j is GDouble<Object, Option<Object>>)
  Assert.isTrue(j is GDouble<Rune, String>)
  Assert.isTrue(j is GOnce<String>)
}
