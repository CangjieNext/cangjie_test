/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a01_01

  @Level:         1

  @Assertion: 6.1.1.2(1)
              Only single inheritance between classes are supported.

  @Description: Check that single inheritance is supported

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006089

*/

import utils.assert.Assert

// Case #1: inheriting an open class
open class A {}
class B <: A {}

func checkCase1() {
  var b = B()
  Assert.isTrue(b is A)
  Assert.isTrue(b is B)
}

// Case #2: inheriting an open class that is already a subclass
open class C {}
open class D <: C {}
class E <: D {}

func checkCase2() {
  var e = E()
  Assert.isTrue(e is C)
  Assert.isTrue(e is D)
  Assert.isTrue(e is E)
}

// Case #3: inhering an abstract class
abstract class F {}
class G <: F {}

func checkCase3() {
  var g = G()
  Assert.isTrue(g is F)
  Assert.isTrue(g is G)
}

// Case #4: inheriting an abstract class that is already a subclass
abstract class H {}
abstract class I <: H {}
class J <: I {}

func checkCase4() {
  var j = J()
  Assert.isTrue(j is H)
  Assert.isTrue(j is I)
  Assert.isTrue(j is J)
}

// Case #5: inheriting a generic open class
open class K<T> {}
class L <: K<Int64> {}

func checkCase5() {
  var l = L()
  Assert.isTrue(l is K<Int64>)
  Assert.isTrue(l is L)
}

// Case #6: inheriting a generic abstract class
abstract class M<T, U> {}
class N <: M<Rune, Bool> {}

func checkCase6() {
  var n = N()
  Assert.isTrue(n is M<Rune, Bool>)
  Assert.isTrue(n is N)
}

main() {
  checkCase1()
  checkCase2()
  checkCase3()
  checkCase4()
  checkCase5()
  checkCase6()
}
