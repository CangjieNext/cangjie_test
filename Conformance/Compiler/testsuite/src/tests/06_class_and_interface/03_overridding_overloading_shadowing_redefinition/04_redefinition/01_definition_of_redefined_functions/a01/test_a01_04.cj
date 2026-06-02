/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a01_04

  @Level:         1

  @Assertion: 6.3.4.1(1)
              If a non-abstract static function with a name same
              as a non-abstract static function in the superclass is declared,
              the function can be declared with an optional modifier redef
              (indicating that it redefines the existing one).

  @Description: Check that the modifier 'redef' is optional for functions
                that redefine static overloaded functions in generic subtypes

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006426

*/

import utils.assert.Assert

open class A {
    public static func f() {
        return 0
    }
    public static func f(x: Int64) {
        return 0
    }
    public static func f(x: String) {
        return 0
    }
    public static func f(a: Rune, b: Unit, c: Bool) {
        return 0
    }

    public static func g<T>() {
        return 0
    }
    public static func g<T>(x: Int64) {
        return 0
    }
    public static func g<T>(x: String) {
        return 0
    }
    public static func g<T>(a: Rune, b: Unit, c: Bool) {
        return 0
    }
}

interface I {
    static func i() {
        return 0
    }
    static func i(x: Int64) {
        return 0
    }
    static func i(x: String) {
        return 0
    }
    static func i(a: Rune, b: Unit, c: Bool) {
        return 0
    }

    static func j():Int64
    static func j(x: Int64): Int64
    static func j(x: String): Int64
    static func j(a: Rune, b: Unit, c: Bool): Int64

    static func k<T>() {
        return 0
    }
    static func k<T>(x: Int64) {
        return 0
    }
    static func k<T>(x: String) {
        return 0
    }
    static func k<T>(a: Rune, b: Unit, c: Bool) {
        return 0
    }

    static func l<T>():Int64
    static func l<T>(x: Int64): Int64
    static func l<T>(x: String): Int64
    static func l<T>(a: Rune, b: Unit, c: Bool): Int64
}

class C1<U> <: A & I {
    public redef static func f() {
        return 301
    }
    public redef static func f(x: Int64) {
        return 302
    }
    public redef static func f(x: String) {
        return 303
    }
    public redef static func f(a: Rune, b: Unit, c: Bool) {
        return 304
    }

    public redef static func g<T>() {
        return 305
    }
    public redef static func g<T>(x: Int64) {
        return 306
    }
    public redef static func g<T>(x: String) {
        return 307
    }
    public redef static func g<T>(a: Rune, b: Unit, c: Bool) {
        return 308
    }

    public redef static func i() {
        return 309
    }
    public redef static func i(x: Int64) {
        return 310
    }
    public redef static func i(x: String) {
        return 311
    }
    public redef static func i(a: Rune, b: Unit, c: Bool) {
        return 312
    }

    public redef static func j() {
        return 313
    }
    public redef static func j(x: Int64) {
        return 314
    }
    public redef static func j(x: String) {
        return 315
    }
    public redef static func j(a: Rune, b: Unit, c: Bool) {
        return 316
    }

    public redef static func k<T>() {
        return 317
    }
    public redef static func k<T>(x: Int64) {
        return 318
    }
    public redef static func k<T>(x: String) {
        return 319
    }
    public redef static func k<T>(a: Rune, b: Unit, c: Bool) {
        return 320
    }

    public redef static func l<T>() {
        return 321
    }
    public redef static func l<T>(x: Int64) {
        return 322
    }
    public redef static func l<T>(x: String) {
        return 323
    }
    public redef static func l<T>(a: Rune, b: Unit, c: Bool) {
        return 324
    }

    func check() {
        Assert.equals(301, f())
        Assert.equals(302, f(1))
        Assert.equals(303, f(""))
        Assert.equals(304, f(r'a', (), false))
        Assert.equals(305, g<Unit>())
        Assert.equals(306, g<Unit>(1))
        Assert.equals(307, g<Unit>(""))
        Assert.equals(308, g<Unit>(r'a', (), false))
        Assert.equals(309, i())
        Assert.equals(310, i(1))
        Assert.equals(311, i(""))
        Assert.equals(312, i(r'a', (), false))
        Assert.equals(313, j())
        Assert.equals(314, j(1))
        Assert.equals(315, j(""))
        Assert.equals(316, j(r'a', (), false))
        Assert.equals(317, k<Unit>())
        Assert.equals(318, k<Unit>(1))
        Assert.equals(319, k<Unit>(""))
        Assert.equals(320, k<Unit>(r'a', (), false))
        Assert.equals(321, l<Unit>())
        Assert.equals(322, l<Unit>(1))
        Assert.equals(323, l<Unit>(""))
        Assert.equals(324, l<Unit>(r'a', (), false))
    }
}

class C2<U> <: A & I {
    public static func f() {
        return 401
    }
    public static func f(x: Int64) {
        return 402
    }
    public static func f(x: String) {
        return 403
    }
    public static func f(a: Rune, b: Unit, c: Bool) {
        return 404
    }

    public static func g<T>() {
        return 405
    }
    public static func g<T>(x: Int64) {
        return 406
    }
    public static func g<T>(x: String) {
        return 407
    }
    public static func g<T>(a: Rune, b: Unit, c: Bool) {
        return 408
    }

    public static func i() {
        return 409
    }
    public static func i(x: Int64) {
        return 410
    }
    public static func i(x: String) {
        return 411
    }
    public static func i(a: Rune, b: Unit, c: Bool) {
        return 412
    }

    public static func j() {
        return 413
    }
    public static func j(x: Int64) {
        return 414
    }
    public static func j(x: String) {
        return 415
    }
    public static func j(a: Rune, b: Unit, c: Bool) {
        return 416
    }

    public static func k<T>() {
        return 417
    }
    public static func k<T>(x: Int64) {
        return 418
    }
    public static func k<T>(x: String) {
        return 419
    }
    public static func k<T>(a: Rune, b: Unit, c: Bool) {
        return 420
    }

    public static func l<T>() {
        return 421
    }
    public static func l<T>(x: Int64) {
        return 422
    }
    public static func l<T>(x: String) {
        return 423
    }
    public static func l<T>(a: Rune, b: Unit, c: Bool) {
        return 424
    }

    func check() {
        Assert.equals(401, f())
        Assert.equals(402, f(1))
        Assert.equals(403, f(""))
        Assert.equals(404, f(r'a', (), false))
        Assert.equals(405, g<Unit>())
        Assert.equals(406, g<Unit>(1))
        Assert.equals(407, g<Unit>(""))
        Assert.equals(408, g<Unit>(r'a', (), false))
        Assert.equals(409, i())
        Assert.equals(410, i(1))
        Assert.equals(411, i(""))
        Assert.equals(412, i(r'a', (), false))
        Assert.equals(413, j())
        Assert.equals(414, j(1))
        Assert.equals(415, j(""))
        Assert.equals(416, j(r'a', (), false))
        Assert.equals(417, k<Unit>())
        Assert.equals(418, k<Unit>(1))
        Assert.equals(419, k<Unit>(""))
        Assert.equals(420, k<Unit>(r'a', (), false))
        Assert.equals(421, l<Unit>())
        Assert.equals(422, l<Unit>(1))
        Assert.equals(423, l<Unit>(""))
        Assert.equals(424, l<Unit>(r'a', (), false))
    }
}

main() {
    C1<Rune>().check()
    C2<Array<Bool>>().check()
}