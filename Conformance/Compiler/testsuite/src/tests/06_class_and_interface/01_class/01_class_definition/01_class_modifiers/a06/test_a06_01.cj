/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a06_01

  @Level:         1

  @Assertion: 6.1.1.1(6)
              Non-abstract classes without open modifiers cannot be inherited.

  @Description: Check that abstract classes can be inherited.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

abstract class A {}
public abstract class B {}
abstract public class C {}

abstract class D<T> {}
public abstract class E<U, V>  {}
abstract public class F<X, Y, Z> {}

// Check the inheritance of all combinations of modifiers with 'abstract'
abstract class AJunior <: A {}
public abstract class BJunior <: B {}
abstract public class CJunior <: C {}

//Check the inheritance of all combinations of modifiers with 'abstract' for generics
abstract class DJunior<T> <: D<T> {}
public abstract class EJunior<U, V> <: E<U, V> {}
abstract public class FJunior<X, Y, Z>  <: F<X, Y, Z>  {}

// Check that derivative classes can also be inherited
class ATheThird <: AJunior {}
public class BTheThird <: BJunior {}
public class CTheThird <: CJunior {}

class DTheThird<T> <: DJunior<T> {}
class ETheThird<U, V> <: EJunior<U, V> {}
class FTheThird<x, y, z> <: FJunior<x, y, z> {}

main() {
  var aa = ATheThird()
  var bb = BTheThird()
  var cc = CTheThird()
  var dd = DTheThird<Bool>()
  var ee = ETheThird<AJunior, A>()
  var ff = FTheThird<Int32, Int32, Int32>()

  Assert.isTrue(aa is A)
  Assert.isTrue(aa is AJunior)
  Assert.isTrue(aa is ATheThird)
  Assert.isTrue(bb is B)
  Assert.isTrue(bb is BJunior)
  Assert.isTrue(bb is BTheThird)
  Assert.isTrue(cc is C)
  Assert.isTrue(cc is CJunior)
  Assert.isTrue(cc is CTheThird)
  Assert.isTrue(dd is D<Bool>)
  Assert.isTrue(dd is DJunior<Bool>)
  Assert.isTrue(dd is DTheThird<Bool>)
  Assert.isTrue(ee is E<AJunior, A>)
  Assert.isTrue(ee is EJunior<AJunior, A>)
  Assert.isTrue(ee is ETheThird<AJunior, A>)
  Assert.isTrue(ff is F<Int32, Int32, Int32>)
  Assert.isTrue(ff is FJunior<Int32, Int32, Int32>)
  Assert.isTrue(ff is FTheThird<Int32, Int32, Int32>)
}
