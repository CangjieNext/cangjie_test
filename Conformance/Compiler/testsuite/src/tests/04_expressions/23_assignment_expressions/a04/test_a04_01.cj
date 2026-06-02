
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a04_01

  @Level:         1

  @Assertion:   4.23(4) For compound assignment expressions, the left value of the expression to the left of = is
                always computed first, then the right value is taken from this left value, then the right value is
                computed with the expression to the right of = (if there is a short-circuit rule, it will continue to
                follow the short-circuit rule), and finally the value is assigned.
  @Description: Checks that the expression to the left of = is evaluated first, then the expression to the right of =,
                and finally the assignment.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore
  @Issue: 6468

*/

import utils.assert.Assert

class C {
    let x0 = 123
    let x1 = 321
    let shift = 1
    let d0 = 123.0
    let d1 = 321.0
    let bf = false
    let bt = true

    var x = 123
    var d = 123.0
    var b = true
    var s = ""

    func f<T>(x : T, y : T) where T <: Equatable<T>{
        Assert.equals(y, x)
        s += "f"
        return this
    }

    func g<T>(x : T, y : T) where T <: Equatable<T> {
        Assert.equals(y, x)
        s += "g"
        return this
    }

    func doInit() {
        x = x0
        s = ""
    }
}

main() {
    let c = C()

    c.doInit()
    c.f(c.x0, c.x).x += c.g(c.x0, c.x).x1
    Assert.equals(c.x0 + c.x1, c.x)
    Assert.equals("fg", c.s)

    c.doInit()
    c.f(c.x0, c.x).x -= c.g(c.x0, c.x).x1
    Assert.equals(c.x0 - c.x1, c.x)
    Assert.equals("fg", c.s)

    c.doInit()
    c.f(c.x0, c.x).x *= c.g(c.x0, c.x).x1
    Assert.equals(c.x0 * c.x1, c.x)
    Assert.equals("fg", c.s)

    c.doInit()
    c.f(c.x0, c.x).x /= c.g(c.x0, c.x).x1
    Assert.equals(c.x0 / c.x1, c.x)
    Assert.equals("fg", c.s)

    c.doInit()
    c.f(c.d0, c.d).d **= c.g(c.d0, c.d).d1
    Assert.equals(c.d0 ** c.d1, c.d)
    Assert.equals("fg", c.s)

    c.doInit()
    c.f(c.x0, c.x).x %= c.g(c.x0, c.x).x1
    Assert.equals(c.x0 % c.x1, c.x)
    Assert.equals("fg", c.s)

    c.doInit()
    c.f(c.x0, c.x).x <<= c.g(c.x0, c.x).shift
    Assert.equals(c.x0 << c.shift, c.x)
    Assert.equals("fg", c.s)

    c.doInit()
    c.f(c.x0, c.x).x >>= c.g(c.x0, c.x).shift
    Assert.equals(c.x0 >> c.shift, c.x)
    Assert.equals("fg", c.s)

    c.doInit()
    c.f(c.x0, c.x).x &= c.g(c.x0, c.x).x1
    Assert.equals(c.x0 & c.x1, c.x)
    Assert.equals("fg", c.s)

    c.doInit()
    c.f(c.x0, c.x).x |= c.g(c.x0, c.x).x1
    Assert.equals(c.x0 | c.x1, c.x)
    Assert.equals("fg", c.s)

    c.doInit()
    c.f(c.x0, c.x).x ^= c.g(c.x0, c.x).x1
    Assert.equals(c.x0 ^ c.x1, c.x)
    Assert.equals("fg", c.s)

    c.doInit()
    c.b = c.bt
    c.f(c.bt, c.b).b &&= c.g(c.bt, c.b).bf
    Assert.equals(c.bt && c.bf, c.b)
    Assert.equals("fg", c.s)

    c.doInit()
    c.b = c.bf
    c.f(c.bf, c.b).b &&= c.g(c.bf, c.b).bt
    Assert.equals(c.bf && c.bt, c.b)
    Assert.equals("f", c.s)

    c.doInit()
    c.b = c.bf
    c.f(c.bf, c.b).b ||= c.g(c.bf, c.b).bt
    Assert.equals(c.bf || c.bt, c.b)
    Assert.equals("fg", c.s)

    c.doInit()
    c.b = c.bt
    c.f(c.bt, c.b).b ||= c.g(c.bt, c.b).bf
    Assert.equals(c.bt || c.bf, c.b)
    Assert.equals("f", c.s)
}
