/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a08_01

  @Level:         1

  @Assertion: 6.1.1.3(8)
              When implementing a non-generic interface, it cannot be directly implemented multiple times.

  @Description: Check that non-generic interfaces can be indirecly implemented several times

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

// Indirect implementation through interfaces
interface I1 {}
interface I2 <: I1 {}
interface I3 <: I2 {}

class A <: I1 & I2 & I3 {}

// Indirect implementation through a superclass
interface I {}
open class B <: I {}
class C <: B & I {}

// Indirect implementation through both superclass and interfaces
interface Triple {}
interface Double <: Triple {}
interface Once <: Double {}
open class D <: Triple {}
class E <: D & Triple & Double & Once {}

// Indirect implementation through interfaces for a generic class
interface FG1 {}
interface FG2 <: FG1 {}
interface FG3 <: FG2 {}

class GA<T> <: FG1 & FG2 & FG3 {}

// Indirect implementation through a superclass for a generic class
interface FG {}
open class GB<T> <: FG {}
class GC<T> <: GB<T> & FG {}

// Indirect implementation through both superclass and interfaces for a generic class
interface GTriple {}
interface GDouble <: GTriple {}
interface GOnce <: GDouble {}
open class GD <: GTriple {}
class GE<T1, T2> <: GD & GTriple & GDouble & GOnce {}

main() {
  var a = A()
  Assert.isTrue(a is A)
  Assert.isTrue(a is I1)
  Assert.isTrue(a is I2)
  Assert.isTrue(a is I3)

  var c = C()
  Assert.isTrue(c is C)
  Assert.isTrue(c is I)

  var e = E()
  Assert.isTrue(e is E)
  Assert.isTrue(e is Triple)
  Assert.isTrue(e is Double)
  Assert.isTrue(e is Once)

  var ga = GA<Bool>()
  Assert.isTrue(ga is GA<Bool>)
  Assert.isTrue(ga is FG1)
  Assert.isTrue(ga is FG2)
  Assert.isTrue(ga is FG3)

  var gc = GC<String>()
  Assert.isTrue(gc is GC<String>)
  Assert.isTrue(gc is FG)

  var ge = GE<Unit, Unit>()
  Assert.isTrue(ge is GE<Unit, Unit>)
  Assert.isTrue(ge is GTriple)
  Assert.isTrue(ge is GDouble)
  Assert.isTrue(ge is GOnce)
}
