/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a33_01

  @Level:         1

  @Assertion: 6.1.2.4(33)
              Note that a function cannot be declared with both open and static.

  @Description: Check that a class can define open functions without the 'static' modifier
                and static functions without the 'open' modifier

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

open class Open {
    public open func a() {}
    public open func b(x: String) {}
    public open func c() {
        return r'y'
    }
    public open func d(x: Rune) {
        return r']'
    }

    static func e() {}
    static func f(x: (Int64, Int64)) {}
    static func g() {
        return "p"
    }
    static func h(x: Unit, y: Unit) {
        return "mm"
    }

    func test() {
        Assert.isTrue(a() is Unit)
        Assert.isTrue(b("") is Unit)
        Assert.equals(r'y', c())
        Assert.equals(r']', d(r'('))

        Assert.isTrue(e() is Unit)
        Assert.isTrue(f((1, 1)) is Unit)
        Assert.equals("p", g())
        Assert.equals("mm", h((), ()))
    }
}

abstract class Abstract {
    public open func a() {}
    public open func b(x: String) {}
    public open func c() {
        return r'y'
    }
    public open func d(x: Rune) {
        return r']'
    }

    static func e() {}
    static func f(x: (Int64, Int64)) {}
    static func g() {
        return "p"
    }
    static func h(x: Unit, y: Unit) {
        return "mm"
    }

    func test() {
        Assert.isTrue(a() is Unit)
        Assert.isTrue(b("") is Unit)
        Assert.equals(r'y', c())
        Assert.equals(r']', d(r'('))

        Assert.isTrue(e() is Unit)
        Assert.isTrue(f((1, 1)) is Unit)
        Assert.equals("p", g())
        Assert.equals("mm", h((), ()))
    }
}

class Real <: Abstract {}

sealed abstract class Sealed {
    public open func a() {}
    public open func b(x: String) {}
    public open func c() {
        return r'y'
    }
    public open func d(x: Rune) {
        return r']'
    }

    static func e() {}
    static func f(x: (Int64, Int64)) {}
    static func g() {
        return "p"
    }
    static func h(x: Unit, y: Unit) {
        return "mm"
    }

    func test() {
        Assert.isTrue(a() is Unit)
        Assert.isTrue(b("") is Unit)
        Assert.equals(r'y', c())
        Assert.equals(r']', d(r'('))

        Assert.isTrue(e() is Unit)
        Assert.isTrue(f((1, 1)) is Unit)
        Assert.equals("p", g())
        Assert.equals("mm", h((), ()))
    }
}

main() {
    Open().test()
    Real().test()
}