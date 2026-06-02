
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a25_01

  @Level:         1

  @Assertion:   4.23(25) The following examples show the usage of compound assignment expressions.
                a **= b a *= b a /= b a %= b a += b a -= b a <<= b a >>= b a &&= b a ||= b a &= b a ^= b a |= b
  @Description: Checks compilation and execution of a program that uses the given compound assignment expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

main() {
    var s = "a"
    s += "b"
    Assert.equals("ab", s)
    var i = 1
    i += 1
    Assert.equals(2, i)
    i -= 1
    Assert.equals(1, i)
    i *= 4
    Assert.equals(4, i)
    i /= 2
    Assert.equals(2, i)
    i **= 3
    Assert.equals(8, i)
    i %= 5
    Assert.equals(3, i)
    i <<= 1
    Assert.equals(6, i)
    i >>= 1
    Assert.equals(3, i)
    i |= 4
    Assert.equals(7, i)
    i ^= 13
    Assert.equals(10, i)
    i &= 24
    Assert.equals(8, i)

    var b = true
    b &&= false
    Assert.equals(false, b)
    b ||= true
    Assert.equals(true, b)
}

