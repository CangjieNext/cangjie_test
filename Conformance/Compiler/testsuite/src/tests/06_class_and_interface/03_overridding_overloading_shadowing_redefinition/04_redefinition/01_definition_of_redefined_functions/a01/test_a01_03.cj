/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a01_03

  @Level:         1

  @Assertion: 6.3.4.1(1)
              If a non-abstract static function with a name same
              as a non-abstract static function in the superclass is declared,
              the function can be declared with an optional modifier redef
              (indicating that it redefines the existing one).

  @Description: Check that the modifier 'redef' is optional for functions
                that redefine static overloaded functions

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

class C1 <: A & I {
    public redef static func f() {
        return 101
    }
    public redef static func f(x: Int64) {
        return 102
    }
    public redef static func f(x: String) {
        return 103
    }
    public redef static func f(a: Rune, b: Unit, c: Bool) {
        return 104
    }

    public redef static func g<T>() {
        return 105
    }
    public redef static func g<T>(x: Int64) {
        return 106
    }
    public redef static func g<T>(x: String) {
        return 107
    }
    public redef static func g<T>(a: Rune, b: Unit, c: Bool) {
        return 108
    }

    public redef static func i() {
        return 109
    }
    public redef static func i(x: Int64) {
        return 110
    }
    public redef static func i(x: String) {
        return 111
    }
    public redef static func i(a: Rune, b: Unit, c: Bool) {
        return 112
    }

    public redef static func j() {
        return 113
    }
    public redef static func j(x: Int64) {
        return 114
    }
    public redef static func j(x: String) {
        return 115
    }
    public redef static func j(a: Rune, b: Unit, c: Bool) {
        return 116
    }

    public redef static func k<T>() {
        return 117
    }
    public redef static func k<T>(x: Int64) {
        return 118
    }
    public redef static func k<T>(x: String) {
        return 119
    }
    public redef static func k<T>(a: Rune, b: Unit, c: Bool) {
        return 120
    }

    public redef static func l<T>() {
        return 121
    }
    public redef static func l<T>(x: Int64) {
        return 122
    }
    public redef static func l<T>(x: String) {
        return 123
    }
    public redef static func l<T>(a: Rune, b: Unit, c: Bool) {
        return 124
    }

    func check() {
        Assert.equals(101, f())
        Assert.equals(102, f(1))
        Assert.equals(103, f(""))
        Assert.equals(104, f(r'a', (), false))
        Assert.equals(105, g<Unit>())
        Assert.equals(106, g<Unit>(1))
        Assert.equals(107, g<Unit>(""))
        Assert.equals(108, g<Unit>(r'a', (), false))
        Assert.equals(109, i())
        Assert.equals(110, i(1))
        Assert.equals(111, i(""))
        Assert.equals(112, i(r'a', (), false))
        Assert.equals(113, j())
        Assert.equals(114, j(1))
        Assert.equals(115, j(""))
        Assert.equals(116, j(r'a', (), false))
        Assert.equals(117, k<Unit>())
        Assert.equals(118, k<Unit>(1))
        Assert.equals(119, k<Unit>(""))
        Assert.equals(120, k<Unit>(r'a', (), false))
        Assert.equals(121, l<Unit>())
        Assert.equals(122, l<Unit>(1))
        Assert.equals(123, l<Unit>(""))
        Assert.equals(124, l<Unit>(r'a', (), false))
    }
}

class C2 <: A & I {
    public static func f() {
        return 201
    }
    public static func f(x: Int64) {
        return 202
    }
    public static func f(x: String) {
        return 203
    }
    public static func f(a: Rune, b: Unit, c: Bool) {
        return 204
    }

    public static func g<T>() {
        return 205
    }
    public static func g<T>(x: Int64) {
        return 206
    }
    public static func g<T>(x: String) {
        return 207
    }
    public static func g<T>(a: Rune, b: Unit, c: Bool) {
        return 208
    }

    public static func i() {
        return 209
    }
    public static func i(x: Int64) {
        return 210
    }
    public static func i(x: String) {
        return 211
    }
    public static func i(a: Rune, b: Unit, c: Bool) {
        return 212
    }

    public static func j() {
        return 213
    }
    public static func j(x: Int64) {
        return 214
    }
    public static func j(x: String) {
        return 215
    }
    public static func j(a: Rune, b: Unit, c: Bool) {
        return 216
    }

    public static func k<T>() {
        return 217
    }
    public static func k<T>(x: Int64) {
        return 218
    }
    public static func k<T>(x: String) {
        return 219
    }
    public static func k<T>(a: Rune, b: Unit, c: Bool) {
        return 220
    }

    public static func l<T>() {
        return 221
    }
    public static func l<T>(x: Int64) {
        return 222
    }
    public static func l<T>(x: String) {
        return 223
    }
    public static func l<T>(a: Rune, b: Unit, c: Bool) {
        return 224
    }

    func check() {
        Assert.equals(201, f())
        Assert.equals(202, f(1))
        Assert.equals(203, f(""))
        Assert.equals(204, f(r'a', (), false))
        Assert.equals(205, g<Unit>())
        Assert.equals(206, g<Unit>(1))
        Assert.equals(207, g<Unit>(""))
        Assert.equals(208, g<Unit>(r'a', (), false))
        Assert.equals(209, i())
        Assert.equals(210, i(1))
        Assert.equals(211, i(""))
        Assert.equals(212, i(r'a', (), false))
        Assert.equals(213, j())
        Assert.equals(214, j(1))
        Assert.equals(215, j(""))
        Assert.equals(216, j(r'a', (), false))
        Assert.equals(217, k<Unit>())
        Assert.equals(218, k<Unit>(1))
        Assert.equals(219, k<Unit>(""))
        Assert.equals(220, k<Unit>(r'a', (), false))
        Assert.equals(221, l<Unit>())
        Assert.equals(222, l<Unit>(1))
        Assert.equals(223, l<Unit>(""))
        Assert.equals(224, l<Unit>(r'a', (), false))
    }
}

main() {
    C1().check()
    C2().check()
}