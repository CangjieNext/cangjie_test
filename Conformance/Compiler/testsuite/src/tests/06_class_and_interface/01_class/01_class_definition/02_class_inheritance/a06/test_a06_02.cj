/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a06_02

  @Level:         1

  @Assertion: 6.1.1.2(6)
              Legal type arguments should be provided when the generic class is inherited.

  @Description: Check that a generic class can be inherited if legal generic arguments are provided during the inheritance

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084, 0006032

  @Comment: It's unclear whether generic parameters without constraints 
            should work as superclass' parameters while inheriting generics with constraints.
            Depending on the resolution of 0006032 we need to add additional positive or negative tests.

*/

import utils.assert.Assert

public open class TestA0602<T, U, V> {}
abstract class GenericAbstract<T1, T2> {}
sealed abstract class GenericSealed<T> {}

class A<T, U, V> <: TestA0602<T, U, V> {}
class B<A1, A2>  <: GenericAbstract<A1, A2> {}
class C<FHHFKA>  <: GenericSealed<FHHFKA> {}

open class GenericOpenWithConstraints<T1, T2> {}
abstract class GenericAbstractWithConstraints<X, Y, Z> {}
sealed abstract class GenericSealedWithConstraints<U, V> where V <: TestA0602<Bool, Rune, Unit> {}

class D<T1, T2> <: GenericOpenWithConstraints<T2, T1> {}
class E<x, y, z> <: GenericAbstractWithConstraints<x, y, z> {}
class F<U, V> <: GenericSealedWithConstraints<U, V> where V <: TestA0602<Bool, Rune, Unit> {}

main() {
  let a = A<Rune, Rune, Rune>()
  Assert.isTrue(a is A<Rune, Rune, Rune>)
  Assert.isTrue(a is TestA0602<Rune, Rune, Rune>)

  let b = B<Int64, Int64>()
  Assert.isTrue(b is B<Int64, Int64>)
  Assert.isTrue(b is GenericAbstract<Int64, Int64>)

  let c = C<Rune>()
  Assert.isTrue(c is C<Rune>)
  Assert.isTrue(c is GenericSealed<Rune>)

  let d = D<A<Int32, Int32, Int32>, TestA0602<Int32, Int32, Int32>>()
  Assert.isTrue(d is D<A<Int32, Int32, Int32>, TestA0602<Int32, Int32, Int32>>)
  Assert.isTrue(d is GenericOpenWithConstraints<TestA0602<Int32, Int32, Int32>, A<Int32, Int32, Int32>>)

  let e = E<Box<Bool>, Object, Any>()
  Assert.isTrue(e is E<Box<Bool>, Object, Any>)
  Assert.isTrue(e is GenericAbstractWithConstraints<Box<Bool>, Object, Any>)

  let f = F<A<Bool, Rune, Unit>, TestA0602<Bool, Rune, Unit>>()
  Assert.isTrue(f is F<A<Bool, Rune, Unit>, TestA0602<Bool, Rune, Unit>>)
  Assert.isTrue(f is GenericSealedWithConstraints<A<Bool, Rune, Unit>, TestA0602<Bool, Rune, Unit>>)
}
