/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a03_01

  @Level:         1

  @Assertion: 6.1.1.2(3)
              Note that the superclass must be a different class.

  @Description: Check that there're no errors when the superclass and the subclass are different classes

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class A1 {}
class A2 <: A1 {}

open class B1<T> {}
class B2 <: B1<Int64> {}

open class C1 {}
class C2<T> <: C1 {}

open class D1<T> {}
class D2<U> <: D1<U> {}

abstract class E1 {}
class E2 <: E1 {}

abstract class F1<T> {}
class F2 <: F1<Bool> {}

abstract class G1 {}
class G2<T> <: G1 {}

abstract class H1<T> {}
class H2<U> <: H1<U> {}

main() {
  let a = A2()
  Assert.isTrue(a is A1)
  Assert.isTrue(a is A2)
  let b = B2()
  Assert.isTrue(b is B1<Int64>)
  Assert.isTrue(b is B2)
  let c = C2<Rune>()
  Assert.isTrue(c is C1)
  Assert.isTrue(c is C2<Rune>)
  let d = D2<Bool>()
  Assert.isTrue(d is D1<Bool>)
  Assert.isTrue(d is D2<Bool>)

  let e = E2()
  Assert.isTrue(e is E1)
  Assert.isTrue(e is E2)
  let f = F2()
  Assert.isTrue(f is F1<Bool>)
  Assert.isTrue(f is F2)
  let g = G2<Int64>()
  Assert.isTrue(g is G1)
  Assert.isTrue(g is G2<Int64>)
  let h = H2<Int64>()
  Assert.isTrue(h is H1<Int64>)
  Assert.isTrue(h is H2<Int64>)

}
