/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a01_06

  @Level:         1

  @Assertion: 6.3.4.1(1)
              If a non-abstract static function with a name same
              as a non-abstract static function in the superclass is declared,
              the function can be declared with an optional modifier redef
              (indicating that it redefines the existing one).

  @Description: Check that the modifier 'redef' is optional for functions
                that redefine functions. All the functions from supertypes are overloaded

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006426

*/

import utils.assert.Assert

open class A {
    public static func f(x: Rune, y: String) {
        return 0
    }
    public static func f<T>(x: Rune, y: Rune) {
        return 0
    }
}

interface I {
    static func f(x: String, y: Rune) {
        return 0
    }
    static func f(x: String, y: String): Int64

    static func f<T>(x: String) {
        return 0
    }
    static func f<T>(x: Rune): Int64
}

class C1 <: A & I {
    public redef static func f(x: Rune, y: String) {
        return 11
    }
    public redef static func f<T>(x: Rune, y: Rune) {
        return 12
    }

    public redef static func f(x: String, y: Rune) {
        return 13
    }
    public redef static func f(x: String, y: String) {
        return 14
    }
    public redef static func f<T>(x: String) {
        return 15
    }
    public redef static func f<T>(x: Rune) {
        return 16
    }
}

class C2 <: A & I {
    public static func f(x: Rune, y: String) {
        return 21
    }
    public static func f<T>(x: Rune, y: Rune) {
        return 22
    }

    public static func f(x: String, y: Rune) {
        return 23
    }
    public static func f(x: String, y: String) {
        return 24
    }
    public static func f<T>(x: String) {
        return 25
    }
    public static func f<T>(x: Rune) {
        return 26
    }
}

class C3<U> <: A & I {
    public redef static func f(x: Rune, y: String) {
        return 31
    }
    public redef static func f<T>(x: Rune, y: Rune) {
        return 32
    }

    public redef static func f(x: String, y: Rune) {
        return 33
    }
    public redef static func f(x: String, y: String) {
        return 34
    }
    public redef static func f<T>(x: String) {
        return 35
    }
    public redef static func f<T>(x: Rune) {
        return 36
    }
}

class C4<U> <: A & I {
    public static func f(x: Rune, y: String) {
        return 41
    }
    public static func f<T>(x: Rune, y: Rune) {
        return 42
    }

    public static func f(x: String, y: Rune) {
        return 43
    }
    public static func f(x: String, y: String) {
        return 44
    }
    public static func f<T>(x: String) {
        return 45
    }
    public static func f<T>(x: Rune) {
        return 46
    }
}

main() {
    let c1 = C1()
    Assert.equals(11, C1.f(r'a', ""))
    Assert.equals(12, C1.f<Unit>(r'a', r'a'))
    Assert.equals(13, C1.f("", r'a'))
    Assert.equals(14, C1.f("", ""))
    Assert.equals(15, C1.f<Unit>(""))
    Assert.equals(16, C1.f<Unit>(r'a'))

    Assert.equals(21, C2.f(r'a', ""))
    Assert.equals(22, C2.f<Unit>(r'a', r'a'))
    Assert.equals(23, C2.f("", r'a'))
    Assert.equals(24, C2.f("", ""))
    Assert.equals(25, C2.f<Unit>(""))
    Assert.equals(26, C2.f<Unit>(r'a'))

    Assert.equals(31, C3<Unit>.f(r'a', ""))
    Assert.equals(32, C3<Unit>.f<Unit>(r'a', r'a'))
    Assert.equals(33, C3<Unit>.f("", r'a'))
    Assert.equals(34, C3<Unit>.f("", ""))
    Assert.equals(35, C3<Unit>.f<Unit>(""))
    Assert.equals(36, C3<Unit>.f<Unit>(r'a'))

    Assert.equals(41, C4<Unit>.f(r'a', ""))
    Assert.equals(42, C4<Unit>.f<Unit>(r'a', r'a'))
    Assert.equals(43, C4<Unit>.f("", r'a'))
    Assert.equals(44, C4<Unit>.f("", ""))
    Assert.equals(45, C4<Unit>.f<Unit>(""))
    Assert.equals(46, C4<Unit>.f<Unit>(r'a'))
}