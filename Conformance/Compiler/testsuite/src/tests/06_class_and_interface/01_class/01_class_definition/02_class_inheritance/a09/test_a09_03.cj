/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a09_03

  @Level:         1

  @Assertion: 6.1.1.2(9)
              If a super class is not defined explicitly, the super class is Object by default.

  @Description: Check that classes without inheritance can satisfy generic constraint <: Object

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

public interface I {}

class InheritedFromObject<T> where T <: Object {}

class A {}
class B <: I {}
class C<T1, T2, T3> {}

public class D {}
public class E <: I {}
public class F<T> {}

open class G {}
open class H <: I {}
open class J<U, V> {}

sealed abstract class K {}
sealed abstract class L <: I {}
sealed abstract class M<T> {}

abstract class N {}
abstract class O <: I {}
abstract class P<T> {}

main() {
  // Classes without modifiers
  var a = InheritedFromObject<A>()
  Assert.isTrue(a is InheritedFromObject<A>)
  var b = InheritedFromObject<B>()
  Assert.isTrue(b is InheritedFromObject<B>)
  var c = InheritedFromObject<C<Float32, Float32, Float32>>()
  Assert.isTrue(c is InheritedFromObject<C<Float32, Float32, Float32>>)

  // Public classes
  var d = InheritedFromObject<D>()
  Assert.isTrue(d is InheritedFromObject<D>)
  var e = InheritedFromObject<E>()
  Assert.isTrue(e is InheritedFromObject<E>)
  var f = InheritedFromObject<F<Rune>>()
  Assert.isTrue(f is InheritedFromObject<F<Rune>>)

  // Open classes
  var g = InheritedFromObject<G>()
  Assert.isTrue(g is InheritedFromObject<G>)
  var h = InheritedFromObject<H>()
  Assert.isTrue(h is InheritedFromObject<H>)
  var j = InheritedFromObject<J<Rune, (Int32, Int32)>>()
  Assert.isTrue(j is InheritedFromObject<J<Rune, (Int32, Int32)>>)

  // Sealed classes
  var k = InheritedFromObject<K>()
  Assert.isTrue(k is InheritedFromObject<K>)
  var l = InheritedFromObject<L>()
  Assert.isTrue(l is InheritedFromObject<L>)
  var m = InheritedFromObject<M<() -> Int32>>()
  Assert.isTrue(m is InheritedFromObject<M<() -> Int32>>)

  // Abstract classes
  var n = InheritedFromObject<N>()
  Assert.isTrue(n is InheritedFromObject<N>)
  var o = InheritedFromObject<O>()
  Assert.isTrue(o is InheritedFromObject<O>)
  var p = InheritedFromObject<P<Int16>>()
  Assert.isTrue(p is InheritedFromObject<P<Int16>>)
}
