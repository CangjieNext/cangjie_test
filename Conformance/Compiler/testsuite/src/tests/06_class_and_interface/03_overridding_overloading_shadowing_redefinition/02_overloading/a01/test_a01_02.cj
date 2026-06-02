/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a01_02

  @Level:         1

  @Assertion: 6.3.2(1)
              Class/Interface does not allow overload between static and instance member functions.
              If the names of static member functions and instance member functions
              (including those defined by the class/interface
              and inherited from super class or super interface) of a class/interface are the same,
              a compilation error is reported.

  @Description: Check that overloading is allowed in interfaces between static functions

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {
    static func f() {
        return 1
    }

    static func f(x: Int64): Int64

    static func f(x: String) {
        return 3
    }

    static func f(x: Rune, y: Rune): Int64
}

interface J <: I {
    static func f(x: Int64) {
        return 2
    }
    static func f(x: Rune, y: Rune) {
        return 4
    }

    static func f(x: Unit) {
        return 5
    }
    static func f(x: Int64, y: Rune): Int64
}

class JImpl <: J {
    static public func f(x: Int64, y: Rune) {
        return 6
    }
}

interface IG<T> {
    static func f() {
        return 11
    }

    static func f(x: Int64): Int64

    static func f(x: T) {
        return 13
    }

    static func f(x: Rune, y: Rune): Int64
}

interface JG<T> <: IG<T> {
    static func f(x: Int64) {
        return 12
    }
    static func f(x: Rune, y: Rune) {
        return 14
    }

    static func f(x: Unit) {
        return 15
    }
    static func f(x: Int64, y: Rune): Int64
}

class JGImpl<T> <: JG<T> {
    static public func f(x: Int64, y: Rune) {
        return 16
    }
}

main() {
    Assert.equals(1, JImpl.f())
    Assert.equals(2, JImpl.f(1))
    Assert.equals(3, JImpl.f(""))
    Assert.equals(4, JImpl.f(r'a', r'b'))
    Assert.equals(5, JImpl.f(()))
    Assert.equals(6, JImpl.f(1, r'a'))

    Assert.equals(11, JGImpl<(Int64, Int64)>.f())
    Assert.equals(12, JGImpl<(Int64, Int64)>.f(1))
    Assert.equals(13, JGImpl<(Int64, Int64)>.f((1, 1)))
    Assert.equals(14, JGImpl<(Int64, Int64)>.f(r'a', r'b'))
    Assert.equals(15, JGImpl<(Int64, Int64)>.f(()))
    Assert.equals(16, JGImpl<(Int64, Int64)>.f(1, r'a'))
}