/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a01_03

  @Level:         1

  @Assertion: 6.3.2(1)
              Class/Interface does not allow overload between static and instance member functions.
              If the names of static member functions and instance member functions
              (including those defined by the class/interface
              and inherited from super class or super interface) of a class/interface are the same,
              a compilation error is reported.

  @Description: Check that overloading is allowed in interfaces between static generic functions

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {
    static func f<U>() {
        return 1
    }

    static func f<U>(x: Int64): Int64

    static func f<U>(x: String) {
        return 3
    }

    static func f<U>(x: Rune, y: Rune): Int64
}

interface J <: I {
    static func f<U>(x: Int64) {
        return 2
    }
    static func f<U>(x: Rune, y: Rune) {
        return 4
    }

    static func f<U>(x: Unit) {
        return 5
    }
    static func f<U>(x: Int64, y: Rune): Int64
}

class JImpl <: J {
    static public func f<U>(x: Int64, y: Rune) {
        return 6
    }
}

interface IG<T> {
    static func f<U>() {
        return 11
    }

    static func f<U>(x: Int64): Int64

    static func f<U>(x: T) {
        return 13
    }

    static func f<U>(x: Rune, y: Rune): Int64
}

interface JG<T> <: IG<T> {
    static func f<U>(x: Int64) {
        return 12
    }
    static func f<U>(x: Rune, y: Rune) {
        return 14
    }

    static func f<U>(x: Unit) {
        return 15
    }
    static func f<U>(x: Int64, y: Rune): Int64
}

class JGImpl<T> <: JG<T> {
    static public func f<U>(x: Int64, y: Rune) {
        return 16
    }
}

main() {
    Assert.equals(1, JImpl.f<()->Int32>())
    Assert.equals(2, JImpl.f<()->Int32>(1))
    Assert.equals(3, JImpl.f<()->Int32>(""))
    Assert.equals(4, JImpl.f<()->Int32>(r'a', r'b'))
    Assert.equals(5, JImpl.f<()->Int32>(()))
    Assert.equals(6, JImpl.f<()->Int32>(1, r'a'))

    Assert.equals(11, JGImpl<(Int64, Int64)>.f<()->Int32>())
    Assert.equals(12, JGImpl<(Int64, Int64)>.f<()->Int32>(1))
    Assert.equals(13, JGImpl<(Int64, Int64)>.f<()->Int32>((1, 1)))
    Assert.equals(14, JGImpl<(Int64, Int64)>.f<()->Int32>(r'a', r'b'))
    Assert.equals(15, JGImpl<(Int64, Int64)>.f<()->Int32>(()))
    Assert.equals(16, JGImpl<(Int64, Int64)>.f<()->Int32>(1, r'a'))
}