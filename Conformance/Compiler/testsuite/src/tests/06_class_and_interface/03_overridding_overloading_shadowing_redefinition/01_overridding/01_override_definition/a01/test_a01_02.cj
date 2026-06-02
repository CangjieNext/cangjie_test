/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a01_02

  @Level:         1

  @Assertion: 6.3.1.1(1)
              If a non-abstract and instance function
              with a name same as a function in the superclass is declared,
              the function can be declared with an optional modifier override
              (indicating that it overwrites the existing one).

  @Description: Check that the modifier 'override' is optional for functions
                that override overloaded functions

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006425, 0006426

*/

import utils.assert.Assert

abstract class A {
    public open func f() {
        return 0
    }
    public open func f(x: Int64) {
        return 0
    }
    public open func f(x: String) {
        return 0
    }
    public open func f(a: Rune, b: Unit, c: Bool) {
        return 0
    }

    public open func g():Int64
    public open func g(x: Int64): Int64
    public open func g(x: String): Int64
    public open func g(a: Rune, b: Unit, c: Bool): Int64
}

interface I {
    func i() {
        return 0
    }
    func i(x: Int64) {
        return 0
    }
    func i(x: String) {
        return 0
    }
    func i(a: Rune, b: Unit, c: Bool) {
        return 0
    }

    func j():Int64
    func j(x: Int64): Int64
    func j(x: String): Int64
    func j(a: Rune, b: Unit, c: Bool): Int64
}

class C1 <: A & I {
    public override func f() {
        return 101
    }
    public override func f(x: Int64) {
        return 102
    }
    public override func f(x: String) {
        return 103
    }
    public override func f(a: Rune, b: Unit, c: Bool) {
        return 104
    }

    public override func g() {
        return 105
    }
    public override func g(x: Int64) {
        return 106
    }
    public override func g(x: String) {
        return 107
    }
    public override func g(a: Rune, b: Unit, c: Bool) {
        return 108
    }

    public override func i() {
        return 109
    }
    public override func i(x: Int64) {
        return 110
    }
    public override func i(x: String) {
        return 111
    }
    public override func i(a: Rune, b: Unit, c: Bool) {
        return 112
    }

    public override func j() {
        return 113
    }
    public override func j(x: Int64) {
        return 114
    }
    public override func j(x: String) {
        return 115
    }
    public override func j(a: Rune, b: Unit, c: Bool) {
        return 116
    }
}

class C2 <: A & I {
    public func f() {
        return 201
    }
    public func f(x: Int64) {
        return 202
    }
    public func f(x: String) {
        return 203
    }
    public func f(a: Rune, b: Unit, c: Bool) {
        return 204
    }

    public func g() {
        return 205
    }
    public func g(x: Int64) {
        return 206
    }
    public func g(x: String) {
        return 207
    }
    public func g(a: Rune, b: Unit, c: Bool) {
        return 208
    }

    public func i() {
        return 209
    }
    public func i(x: Int64) {
        return 210
    }
    public func i(x: String) {
        return 211
    }
    public func i(a: Rune, b: Unit, c: Bool) {
        return 212
    }

    public func j() {
        return 213
    }
    public func j(x: Int64) {
        return 214
    }
    public func j(x: String) {
        return 215
    }
    public func j(a: Rune, b: Unit, c: Bool) {
        return 216
    }
}

class C3<T> <: A & I {
    public override func f() {
        return 301
    }
    public override func f(x: Int64) {
        return 302
    }
    public override func f(x: String) {
        return 303
    }
    public override func f(a: Rune, b: Unit, c: Bool) {
        return 304
    }

    public override func g() {
        return 305
    }
    public override func g(x: Int64) {
        return 306
    }
    public override func g(x: String) {
        return 307
    }
    public override func g(a: Rune, b: Unit, c: Bool) {
        return 308
    }

    public override func i() {
        return 309
    }
    public override func i(x: Int64) {
        return 310
    }
    public override func i(x: String) {
        return 311
    }
    public override func i(a: Rune, b: Unit, c: Bool) {
        return 312
    }

    public override func j() {
        return 313
    }
    public override func j(x: Int64) {
        return 314
    }
    public override func j(x: String) {
        return 315
    }
    public override func j(a: Rune, b: Unit, c: Bool) {
        return 316
    }
}

class C4<T> <: A & I {
    public func f() {
        return 401
    }
    public func f(x: Int64) {
        return 402
    }
    public func f(x: String) {
        return 403
    }
    public func f(a: Rune, b: Unit, c: Bool) {
        return 404
    }

    public func g() {
        return 405
    }
    public func g(x: Int64) {
        return 406
    }
    public func g(x: String) {
        return 407
    }
    public func g(a: Rune, b: Unit, c: Bool) {
        return 408
    }

    public func i() {
        return 409
    }
    public func i(x: Int64) {
        return 410
    }
    public func i(x: String) {
        return 411
    }
    public func i(a: Rune, b: Unit, c: Bool) {
        return 412
    }

    public func j() {
        return 413
    }
    public func j(x: Int64) {
        return 414
    }
    public func j(x: String) {
        return 415
    }
    public func j(a: Rune, b: Unit, c: Bool) {
        return 416
    }
}

main() {
    let c1 = C1()
    Assert.equals(101, c1.f())
    Assert.equals(102, c1.f(1))
    Assert.equals(103, c1.f(""))
    Assert.equals(104, c1.f(r'a', (), false))
    Assert.equals(105, c1.g())
    Assert.equals(106, c1.g(1))
    Assert.equals(107, c1.g(""))
    Assert.equals(108, c1.g(r'a', (), false))
    Assert.equals(109, c1.i())
    Assert.equals(110, c1.i(1))
    Assert.equals(111, c1.i(""))
    Assert.equals(112, c1.i(r'a', (), false))
    Assert.equals(113, c1.j())
    Assert.equals(114, c1.j(1))
    Assert.equals(115, c1.j(""))
    Assert.equals(116, c1.j(r'a', (), false))

    let c2 = C2()
    Assert.equals(201, c2.f())
    Assert.equals(202, c2.f(1))
    Assert.equals(203, c2.f(""))
    Assert.equals(204, c2.f(r'a', (), false))
    Assert.equals(205, c2.g())
    Assert.equals(206, c2.g(1))
    Assert.equals(207, c2.g(""))
    Assert.equals(208, c2.g(r'a', (), false))
    Assert.equals(209, c2.i())
    Assert.equals(210, c2.i(1))
    Assert.equals(211, c2.i(""))
    Assert.equals(212, c2.i(r'a', (), false))
    Assert.equals(213, c2.j())
    Assert.equals(214, c2.j(1))
    Assert.equals(215, c2.j(""))
    Assert.equals(216, c2.j(r'a', (), false))

    let c3 = C3<Rune>()
    Assert.equals(301, c3.f())
    Assert.equals(302, c3.f(1))
    Assert.equals(303, c3.f(""))
    Assert.equals(304, c3.f(r'a', (), false))
    Assert.equals(305, c3.g())
    Assert.equals(306, c3.g(1))
    Assert.equals(307, c3.g(""))
    Assert.equals(308, c3.g(r'a', (), false))
    Assert.equals(309, c3.i())
    Assert.equals(310, c3.i(1))
    Assert.equals(311, c3.i(""))
    Assert.equals(312, c3.i(r'a', (), false))
    Assert.equals(313, c3.j())
    Assert.equals(314, c3.j(1))
    Assert.equals(315, c3.j(""))
    Assert.equals(316, c3.j(r'a', (), false))

    let c4 = C4<Array<Bool>>()
    Assert.equals(401, c4.f())
    Assert.equals(402, c4.f(1))
    Assert.equals(403, c4.f(""))
    Assert.equals(404, c4.f(r'a', (), false))
    Assert.equals(405, c4.g())
    Assert.equals(406, c4.g(1))
    Assert.equals(407, c4.g(""))
    Assert.equals(408, c4.g(r'a', (), false))
    Assert.equals(409, c4.i())
    Assert.equals(410, c4.i(1))
    Assert.equals(411, c4.i(""))
    Assert.equals(412, c4.i(r'a', (), false))
    Assert.equals(413, c4.j())
    Assert.equals(414, c4.j(1))
    Assert.equals(415, c4.j(""))
    Assert.equals(416, c4.j(r'a', (), false))
}