/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a09_01

  @Level:         1

  @Assertion: 6.1.1.2(9)
              If a super class is not defined explicitly, the super class is Object by default.

  @Description: Check that classes without inheritance can access an extended function in Object.

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

extend Object {
  public func myCustomObjectFunction(x: Int64) {
    return x + 42
  }
}

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
  Assert.equals(43, a.myCustomObjectFunction(1))
  var b = B()
  Assert.equals(44, b.myCustomObjectFunction(2))
  var c = C<Rune, Rune, Rune>()
  Assert.equals(45, c.myCustomObjectFunction(3))

  // Public classes
  var d = D()
  Assert.equals(46, d.myCustomObjectFunction(4))
  var e = E()
  Assert.equals(47, e.myCustomObjectFunction(5))
  var f = F<Bool>()
  Assert.equals(48, f.myCustomObjectFunction(6))

  // Open classes
  var g = G()
  Assert.equals(49, g.myCustomObjectFunction(7))
  var h = H()
  Assert.equals(50, h.myCustomObjectFunction(8))
  var j = J<Rune, Option<Rune>>()
  Assert.equals(51, j.myCustomObjectFunction(9))
}
