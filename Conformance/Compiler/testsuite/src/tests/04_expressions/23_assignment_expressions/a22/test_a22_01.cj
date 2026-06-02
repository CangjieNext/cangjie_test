
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a22_01

  @Level:         1

  @Assertion:   4.23(22) In Cangjie, a in a op= b is evaluated only once (and the side effect occurs only once),
                whereas a in a = a op b is evaluated twice (and the side effect occurs twice).
  @Description: Checks that a in a op= b is evaluated only once, whereas a in a = a op b is evaluated twice for
                various op. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6456

*/


import utils.assert.Assert

var counter = 0

class C {
    var x = 0
    var b = true
    func foo() {
        counter++
        return this
    }
}

main() {
    var x = C()

    counter = 0
    x.foo().x = x.foo().x + 1
    Assert.equals(2, counter)
    x.foo().x += 1
    Assert.equals(3, counter)

    counter = 0
    x.foo().x = x.foo().x - 1
    Assert.equals(2, counter)
    x.foo().x -= 1
    Assert.equals(3, counter)

    counter = 0
    x.foo().x = x.foo().x * 1
    Assert.equals(2, counter)
    x.foo().x *= 1
    Assert.equals(3, counter)

    counter = 0
    x.foo().x = x.foo().x / 1
    Assert.equals(2, counter)
    x.foo().x /= 1
    Assert.equals(3, counter)

    counter = 0
    x.foo().x = x.foo().x << 1
    Assert.equals(2, counter)
    x.foo().x <<= 1
    Assert.equals(3, counter)

    counter = 0
    x.foo().x = x.foo().x >> 1
    Assert.equals(2, counter)
    x.foo().x >>= 1
    Assert.equals(3, counter)

    counter = 0
    x.foo().x = x.foo().x & 1
    Assert.equals(2, counter)
    x.foo().x &= 1
    Assert.equals(3, counter)

    counter = 0
    x.foo().x = x.foo().x | 1
    Assert.equals(2, counter)
    x.foo().x |= 1
    Assert.equals(3, counter)

    counter = 0
    x.foo().x = x.foo().x ^ 1
    Assert.equals(2, counter)
    x.foo().x ^= 1
    Assert.equals(3, counter)

    counter = 0
    x.foo().x = x.foo().x % 1
    Assert.equals(2, counter)
    x.foo().x %= 1
    Assert.equals(3, counter)

    counter = 0
    x.foo().x = x.foo().x ** 1
    Assert.equals(2, counter)
    x.foo().x **= 1
    Assert.equals(3, counter)

    counter = 0
    x.foo().b = x.foo().b && true
    Assert.equals(2, counter)
    x.foo().b &&= true
    Assert.equals(3, counter)

    counter = 0
    x.foo().b = x.foo().b || true
    Assert.equals(2, counter)
    x.foo().b ||= true
    Assert.equals(3, counter)
}
