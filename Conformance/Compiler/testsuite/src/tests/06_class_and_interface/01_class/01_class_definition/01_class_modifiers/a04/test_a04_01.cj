/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a04_01

  @Level:         1

  @Assertion: 6.1.1.1(4)
              open: A class modified with open can be inherited.

  @Description: Check that classes with modifier open can be inherited

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class A {}
public open class B {}
open public class C {}

open class D<T> {}
public open class E<U, V>  {}
open public class F<x, y, z> {}

// Check the inheritance of all combinations of modifiers with 'open'
open class A_junior <: A {}
public open class B_junior <: B {}
open public class C_junior <: C {}

//Check the inheritance of all combinations of modifiers with 'open' for generics
open class D_junior<T> <: D<T> {}
public open class E_junior<U, V> <: E<U, V> {}
open public class F_junior<x, y, z> <: F<x, y, z> {}

// Check that derivative classes can also be inherited
class A_III <: A_junior {}
public class B_III <: B_junior {}
public class C_III <: C_junior {}

class D_III<T> <: D_junior<T> {}
class E_III<U, V> <: E_junior<U, V> {}
class F_III<x, y, z> <: F_junior<x, y, z> {}

main() {
  var a = A_junior()
  var b = B_junior()
  var c = C_junior()
  var d = D_junior<Bool>()
  var e = E_junior<A_junior, A>()
  var f = F_junior<Int32, Int32, Int32>()

  Assert.isTrue(a is A)
  Assert.isTrue(a is A_junior)
  Assert.isTrue(b is B)
  Assert.isTrue(b is B_junior)
  Assert.isTrue(c is C)
  Assert.isTrue(c is C_junior)
  Assert.isTrue(d is D<Bool>)
  Assert.isTrue(d is D_junior<Bool>)
  Assert.isTrue(e is E<A_junior, A>)
  Assert.isTrue(e is E_junior<A_junior, A>)
  Assert.isTrue(f is F<Int32, Int32, Int32>)
  Assert.isTrue(f is F_junior<Int32, Int32, Int32>)

  var aa = A_III()
  var bb = B_III()
  var cc = C_III()
  var dd = D_III<Bool>()
  var ee = E_III<A_junior, A>()
  var ff = F_III<Int32, Int32, Int32>()

  Assert.isTrue(aa is A)
  Assert.isTrue(aa is A_junior)
  Assert.isTrue(aa is A_III)
  Assert.isTrue(bb is B)
  Assert.isTrue(bb is B_junior)
  Assert.isTrue(bb is B_III)
  Assert.isTrue(cc is C)
  Assert.isTrue(cc is C_junior)
  Assert.isTrue(cc is C_III)
  Assert.isTrue(dd is D<Bool>)
  Assert.isTrue(dd is D_junior<Bool>)
  Assert.isTrue(dd is D_III<Bool>)
  Assert.isTrue(ee is E<A_junior, A>)
  Assert.isTrue(ee is E_junior<A_junior, A>)
  Assert.isTrue(ee is E_III<A_junior, A>)
  Assert.isTrue(ff is F<Int32, Int32, Int32>)
  Assert.isTrue(ff is F_junior<Int32, Int32, Int32>)
  Assert.isTrue(ff is F_III<Int32, Int32, Int32>)
}
