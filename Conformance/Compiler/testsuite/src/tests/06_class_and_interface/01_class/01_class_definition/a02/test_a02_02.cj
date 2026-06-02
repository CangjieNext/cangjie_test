/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a02_02

  @Level:         1

  @Assertion: 6.1.1(2)
              A class definition consists of the following parts.
              - optional modifiers
              - the class keyword
              - class name
              - optional type parameters
              - optional superclass or a list of super interfaces (listed after <:, and seperated by &). Superclass should be listed at the beginging if there is one.
              - optional generic constraints using keyword where
              - class body

  @Description: Check that optional parts could be omitted from a class definition

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

public interface UtilityInterface1 {}
public interface UtilityInterface2 {}

public open class UtilityClass1 <: UtilityInterface1 {}
public class UtilityClass2 <: UtilityInterface2 {}

// Case #1: no modifiers, no type parameters, no superclass, no interfaces, no generic constraints
class Simple {
  var some_var = 0
}

func checkCase1() {
  let s = Simple()
  Assert.isTrue(s is Simple)
}

// Case #2: no type parameters, no superclass, no interfaces, no generic constraints
abstract class A {}
public class P {}
open class O {}
abstract public class AP {}
abstract class AO {}
public abstract class PA {}
public open class PO {}
abstract class OA {}
open public class OP {}
abstract public class APO {}

class TestableA   <: A   {}
class TestableAP  <: AP  {}
class TestableAO  <: AO  {}
class TestablePA  <: PA  {}
class TestableOA  <: OA  {}
class TestableAPO <: APO {}

func checkCase2() {
  var a = TestableA()
  var p = P()
  var o = O()
  var ap = TestableAP()
  var ao = TestableAO()
  var pa = TestablePA()
  var po = PO()
  var oa = TestableOA()
  var op = OP()
  var apo = TestableAPO()

  Assert.isTrue(a is A)
  Assert.isTrue(p is P)
  Assert.isTrue(o is O)
  Assert.isTrue(ap is AP)
  Assert.isTrue(ao is AO)
  Assert.isTrue(pa is PA)
  Assert.isTrue(po is PO)
  Assert.isTrue(oa is OA)
  Assert.isTrue(op is OP)
  Assert.isTrue(apo is APO)
}

// Case #3: no modifiers, no superclass, no interfaces, no generic constraints

class Gen1<G1> {}
class Gen2<G1, G2> {}
class Gen3<G1, G2, G3> {}

func checkCase3() {
  var g = Gen1<Int32>()
  var gg = Gen2<Int32, Float64>()
  var ggg = Gen3<Int32, Float64, String>()

  Assert.isTrue(g is Gen1<Int32>)
  Assert.isTrue(gg is Gen2<Int32, Float64>)
  Assert.isTrue(ggg is Gen3<Int32, Float64, String>)
}

// Case #4: no modifiers, no type parameters, no interfaces, no generic constraints

class Derivative <: UtilityClass1 {}

func checkCase4() {
  var d = Derivative()

  Assert.isTrue(d is Derivative)
}

// Case #5: no modifiers, no type parameters, no superclass, no generic constraints

class Impl1 <: UtilityInterface1 {}
class Impl2 <: UtilityInterface1 & UtilityInterface2 {}

func checkCase5() {
  var i1 = Impl1()
  var i2 = Impl2()

  Assert.isTrue(i1 is Impl1)
  Assert.isTrue(i2 is Impl2)
}

// Case #6: no modifiers, no superclass, no interfaces

class Constrained<T1, T2> {}
class ConstrainedMore<T1, T2> where T1 <: UtilityInterface1, T2 <: UtilityInterface2 {}

func checkCase6() {
  let c = Constrained<UtilityClass1, UtilityInterface1>()
  let cc = ConstrainedMore<UtilityClass1, UtilityClass2>()

  Assert.isTrue(c is Constrained<UtilityClass1, UtilityInterface1>)
  Assert.isTrue(cc is ConstrainedMore<UtilityClass1, UtilityClass2>)
}

// Case #7: no type parameters, no generic constraints

class NotGeneric <: UtilityClass1 & UtilityInterface1 {}

func checkCase7() {
  var ng = NotGeneric()
  Assert.isTrue(ng is NotGeneric)
}

// Case #8: no modifiers

class NoMods<T> <: UtilityClass1 & UtilityInterface1 where T<:UtilityInterface2 {}

func checkCase8() {
  var nm = NoMods<UtilityClass2>()
  Assert.isTrue(nm is NoMods<UtilityClass2>)
}

// Case #9 : no superclass, no interfaces,

public class Orphan<oOo, uireH> where uireH <: UtilityInterface2 {}

func checkCase9() {
  var o = Orphan<Bool, UtilityClass2>()

  Assert.isTrue(o is Orphan<Bool, UtilityClass2>)
}

main() {
  checkCase1()
  checkCase2()
  checkCase3()
  checkCase4()
  checkCase5()
  checkCase6()
  checkCase7()
  checkCase8()
  checkCase9()
}
