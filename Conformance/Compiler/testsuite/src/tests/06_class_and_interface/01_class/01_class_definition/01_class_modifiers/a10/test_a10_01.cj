/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a10_01

  @Level:         1

  @Assertion: 6.1.1.1(10)
              An abstract class cannot be instantiated.

  @Description: Check that non-abstract classes can be instantiated

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class A {}
public class B {}
open class C {}
public open class D {}
open public class E {}

class F<T> {}
public class G<T> {}
open class H<T> {}
public open class I<T> {}
open public class J<T> {}

main() {
  var a = A()
  var b = B()
  var c = C()
  var d = D()
  var e = E()

  var f = F<Bool>()
  var g = G<Rune>()
  var h = H<A>()
  var i = I<B>()
  var j = J<Unit>()

  Assert.isTrue(a is A)
  Assert.isTrue(b is B)
  Assert.isTrue(c is C)
  Assert.isTrue(d is D)
  Assert.isTrue(e is E)

  Assert.isTrue(f is F<Bool>)
  Assert.isTrue(g is G<Rune>)
  Assert.isTrue(h is H<A>)
  Assert.isTrue(i is I<B>)
  Assert.isTrue(j is J<Unit>)
}
