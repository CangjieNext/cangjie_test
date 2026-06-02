/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a06_01

  @Level:         1

  @Assertion: 6.1.1.2(6)
              Legal type arguments should be provided when the generic class is inherited.

  @Description: Check that a generic class can be inherited if legal concrete arguments are provided during the inheritance

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

public open class TestA0601<T, U, V> {}
abstract class GenericAbstract<T1, T2> {}
sealed abstract class GenericSealed<T> {}

class A <: TestA0601<Bool, Rune, Unit> {}
class B <: GenericAbstract<Int64, Int64> {}
class C <: GenericSealed<Any> {}

open class GenericOpenWithConstraints<T1, T2> {}
abstract class GenericAbstractWithConstraints<X, Y, Z> {}
sealed abstract class GenericSealedWithConstraints<U, V> where V <: TestA0601<Bool, Rune, Unit> {}

class D <: GenericOpenWithConstraints<TestA0601<Bool, Rune, Unit>, A> {}
class E <: GenericAbstractWithConstraints<Box<Bool>, Object, Any> {}
class F <: GenericSealedWithConstraints<A, TestA0601<Bool, Rune, Unit>> {}

main() {
  let a = A()
  Assert.isTrue(a is A)
  Assert.isTrue(a is TestA0601<Bool, Rune, Unit>)

  let b = B()
  Assert.isTrue(b is B)
  Assert.isTrue(b is GenericAbstract<Int64, Int64>)

  let c = C()
  Assert.isTrue(c is C)
  Assert.isTrue(c is GenericSealed<Any>)

  let d = D()
  Assert.isTrue(d is D)
  Assert.isTrue(d is GenericOpenWithConstraints<TestA0601<Bool, Rune, Unit>, A>)

  let e = E()
  Assert.isTrue(e is E)
  Assert.isTrue(e is GenericAbstractWithConstraints<Box<Bool>, Object, Any>)

  let f = F()
  Assert.isTrue(f is F)
  Assert.isTrue(f is GenericSealedWithConstraints<A, TestA0601<Bool, Rune, Unit>>)
}
