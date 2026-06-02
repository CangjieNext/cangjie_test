/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a09_02

  @Level:         1

  @Assertion: 6.1.1.2(9)
              If a super class is not defined explicitly, the super class is Object by default.

  @Description: Check that classes without inheritance are recognized as Object by the operator is.

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

public interface I {}

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

main() {
  // Classes without modifiers
  var a = A()
  Assert.isTrue(a is Object)
  var b = B()
  Assert.isTrue(b is Object)
  var c = C<Rune, Rune, Rune>()
  Assert.isTrue(c is Object)

  // Public classes
  var d = D()
  Assert.isTrue(d is Object)
  var e = E()
  Assert.isTrue(e is Object)
  var f = F<Bool>()
  Assert.isTrue(f is Object)

  // Open classes
  var g = G()
  Assert.isTrue(g is Object)
  var h = H()
  Assert.isTrue(h is Object)
  var j = J<Rune, Option<Rune>>()
  Assert.isTrue(j is Object)
}
