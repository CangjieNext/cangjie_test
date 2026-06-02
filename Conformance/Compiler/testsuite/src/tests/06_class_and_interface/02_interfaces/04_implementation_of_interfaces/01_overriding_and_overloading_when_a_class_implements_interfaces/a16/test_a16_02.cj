/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a16_02

  @Level:         1

  @Assertion: 6.2.4.1(16)
              Note that when a class implements an interface,
              it needs to provide an implementation for the overloaded function declaration.

  @Description: Check that a struct can overload abstract functions without default implementations
                as long as overloaded functions are also defined in the class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006419

*/

import utils.assert.Assert

// Instance functions
interface I1 {
    func f(): Int64

    func g(x: String, y: Rune): Int64
    func g(x: Rune, y: String): Int64
    func g(x: String, y: String): Int64

    func h(x: Bool): Int64
    func h(x1: Bool, y1: Bool): Int64
    func h(x1: Bool, x2: Bool, y2!: Bool): Int64

    func i(p1: Rune, p2: Unit): Int64

    operator func()(x: Int64): Int64
}

struct C1 <: I1 {
    public func f() {
        return 1
    }
    func f(x: Unit) {
        return 2
    }

    public func g(x: String, y: Rune) {
        return 11
    }
    public func g(x: Rune, y: String) {
        return 12
    }
    public func g(x: String, y: String) {
        return 13
    }
    func g(x: Rune, y: Rune) {
        return 14
    }

    public func h(x: Bool) {
        return 21
    }
    public func h(x1: Bool, y1: Bool) {
        return 22
    }
    public func h(x1: Bool, x2: Bool, y2!: Bool) {
        return 23
    }
    func h(x1: Bool, x2: Bool, x3: Bool, x4: Bool) {
        return 24
    }

    public func i(p1: Rune, p2: Unit) {
        return 31
    }
    func i(x: Bool, y: Int64) {
        return 32
    }

    public operator func()(x: Int64) {
        return 41
    }
    operator func()() {
        return 42
    }
}

// Static functions
interface I2 {
    static func f(): Int64

    static func g(x: String, y: Rune): Int64
    static func g(x: Rune, y: String): Int64
    static func g(x: String, y: String): Int64

    static func h(x: Bool): Int64
    static func h(x1: Bool, y1: Bool): Int64
    static func h(x1: Bool, x2: Bool, y2!: Bool): Int64

    static func i(p1: Rune, p2: Unit): Int64
}

struct C2 <: I2 {
    public static func f() {
        return 10
    }
    static func f(x: Unit) {
        return 20
    }

    public static func g(x: String, y: Rune) {
        return 110
    }
    public static func g(x: Rune, y: String) {
        return 120
    }
    public static func g(x: String, y: String) {
        return 130
    }
    static func g(x: Rune, y: Rune) {
        return 140
    }

    public static func h(x: Bool) {
        return 210
    }
    public static func h(x1: Bool, y1: Bool) {
        return 220
    }
    public static func h(x1: Bool, x2: Bool, y2!: Bool) {
        return 230
    }
    static func h(x1: Bool, x2: Bool, x3: Bool, x4: Bool) {
        return 240
    }

    public static func i(p1: Rune, p2: Unit) {
        return 310
    }
    static func i(x: Bool, y: Int64) {
        return 320
    }
}

// Static generic functions
interface I3 {
    static func f<T>(): Int64

    static func g<T>(x: String, y: Rune): Int64
    static func g<T>(x: Rune, y: String): Int64
    static func g<T>(x: String, y: String): Int64

    static func h<T>(x: Bool): Int64
    static func h<T>(x1: Bool, y1: Bool): Int64
    static func h<T>(x1: Bool, x2: Bool, y2!: Bool): Int64

    static func i<T>(p1: Rune, p2: Unit): Int64
}

struct C3 <: I3 {
    public static func f<T>() {
        return 100
    }
    static func f<T>(x: Unit) {
        return 200
    }

    public static func g<T>(x: String, y: Rune) {
        return 1100
    }
    public static func g<T>(x: Rune, y: String) {
        return 1200
    }
    public static func g<T>(x: String, y: String) {
        return 1300
    }
    static func g<T>(x: Rune, y: Rune) {
        return 1400
    }

    public static func h<T>(x: Bool) {
        return 2100
    }
    public static func h<T>(x1: Bool, y1: Bool) {
        return 2200
    }
    public static func h<T>(x1: Bool, x2: Bool, y2!: Bool) {
        return 2300
    }
    static func h<T>(x1: Bool, x2: Bool, x3: Bool, x4: Bool) {
        return 2400
    }

    public static func i<T>(p1: Rune, p2: Unit) {
        return 3100
    }
    static func i<T>(x: Bool, y: Int64) {
        return 3200
    }
}

// Functions with generic parameters
interface I4<T1, T2> {
    func f(x: T1): String
}

struct C4<T1, T2> <: I4<T1, T2> {
    public func f(x: T1) {
        return "1"
    }

    func f(x: T2) {
        return "2"
    }
}

main() {
    let c1 = C1()
    Assert.equals(1, c1.f())
    Assert.equals(2, c1.f(()))
    Assert.equals(11, c1.g("", r'a'))
    Assert.equals(12, c1.g(r'e', "faf"))
    Assert.equals(13, c1.g("", ""))
    Assert.equals(14, c1.g(r'4', r'a'))
    Assert.equals(21, c1.h(true))
    Assert.equals(22, c1.h(true, true))
    Assert.equals(23, c1.h(true, true, y2: true))
    Assert.equals(24, c1.h(true, true, true, true))
    Assert.equals(31, c1.i(r'v', ()))
    Assert.equals(32, c1.i(false, 1))
    Assert.equals(41, c1(1))
    Assert.equals(42, c1())

    Assert.equals(10, C2.f())
    Assert.equals(20, C2.f(()))
    Assert.equals(110, C2.g("", r'a'))
    Assert.equals(120, C2.g(r'e', "faf"))
    Assert.equals(130, C2.g("", ""))
    Assert.equals(140, C2.g(r'4', r'a'))
    Assert.equals(210, C2.h(true))
    Assert.equals(220, C2.h(true, true))
    Assert.equals(230, C2.h(true, true, y2: true))
    Assert.equals(240, C2.h(true, true, true, true))
    Assert.equals(310, C2.i(r'v', ()))
    Assert.equals(320, C2.i(false, 1))

    Assert.equals(100, C3.f<Unit>())
    Assert.equals(200, C3.f<Unit>(()))
    Assert.equals(1100, C3.g<Unit>("", r'a'))
    Assert.equals(1200, C3.g<Unit>(r'e', "faf"))
    Assert.equals(1300, C3.g<Unit>("", ""))
    Assert.equals(1400, C3.g<Unit>(r'4', r'a'))
    Assert.equals(2100, C3.h<Unit>(true))
    Assert.equals(2200, C3.h<Unit>(true, true))
    Assert.equals(2300, C3.h<Unit>(true, true, y2: true))
    Assert.equals(2400, C3.h<Unit>(true, true, true, true))
    Assert.equals(3100, C3.i<Unit>(r'v', ()))
    Assert.equals(3200, C3.i<Unit>(false, 1))

    let c4 = C4<Int64, Bool>()
    Assert.equals("1", c4.f(1))
    Assert.equals("2", c4.f(true))
}