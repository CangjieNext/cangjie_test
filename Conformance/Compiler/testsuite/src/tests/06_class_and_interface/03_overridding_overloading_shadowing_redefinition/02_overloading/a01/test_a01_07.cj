/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a01_07

  @Level:         1

  @Assertion: 6.3.2(1)
              Class/Interface does not allow overload between static and instance member functions.
              If the names of static member functions and instance member functions
              (including those defined by the class/interface
              and inherited from super class or super interface) of a class/interface are the same,
              a compilation error is reported.

  @Description: Check that overloading is allowed in classes between static generic functions

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class A {
    static func f<U>() {
        return 1
    }

    static func f<U>(x: Int64) {
        return 2
    }

    static func f<U>(x: String) {
        return 3
    }

    static func f<U>(x: Rune, y: Rune) {
        return 4
    }
}

class B <: A {
    static func f<U>(x: Unit) {
        return 5
    }
    static func f<U>(x: Int64, y: Rune) {
        return 6
    }
}

open class AG<T> {
    static func f<U>() {
        return 11
    }

    static func f<U>(x: Int64) {
        return 12
    }

    static func f<U>(x: T) {
        return 13
    }

    static func f<U>(x: Rune, y: Rune) {
        return 14
    }
}

class BG<T> <: AG<T> {
    static func f<U>(x: Unit) {
        return 15
    }
    static func f<U>(x: Int64, y: Rune) {
        return 16
    }
}

main() {
    Assert.equals(1, B.f<Nothing>())
    Assert.equals(2, B.f<Nothing>(1))
    Assert.equals(3, B.f<Nothing>(""))
    Assert.equals(4, B.f<Nothing>(r'a', r'b'))
    Assert.equals(5, B.f<Nothing>(()))
    Assert.equals(6, B.f<Nothing>(1, r'a'))

    Assert.equals(11, BG<(Int64, Int64)>.f<Nothing>())
    Assert.equals(12, BG<(Int64, Int64)>.f<Nothing>(1))
    Assert.equals(13, BG<(Int64, Int64)>.f<Nothing>((1, 1)))
    Assert.equals(14, BG<(Int64, Int64)>.f<Nothing>(r'a', r'b'))
    Assert.equals(15, BG<(Int64, Int64)>.f<Nothing>(()))
    Assert.equals(16, BG<(Int64, Int64)>.f<Nothing>(1, r'a'))
}