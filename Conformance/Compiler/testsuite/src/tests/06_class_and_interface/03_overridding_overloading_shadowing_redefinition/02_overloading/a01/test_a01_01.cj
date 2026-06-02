/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a01_01

  @Level:         1

  @Assertion: 6.3.2(1)
              Class/Interface does not allow overload between static and instance member functions.
              If the names of static member functions and instance member functions
              (including those defined by the class/interface
              and inherited from super class or super interface) of a class/interface are the same,
              a compilation error is reported.

  @Description: Check that overloading is allowed in interfaces between instance functions

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {
    func f() {
        return 1
    }

    func f(x: Int64): Int64

    func f(x: String) {
        return 3
    }

    func f(x: Rune, y: Rune): Int64
}

interface J <: I {
    func f(x: Int64) {
        return 2
    }
    func f(x: Rune, y: Rune) {
        return 4
    }

    func f(x: Unit) {
        return 5
    }
    func f(x: Int64, y: Rune): Int64
}

class JImpl <: J {
    public func f(x: Int64, y: Rune) {
        return 6
    }
}

interface IG<T> {
    func f() {
        return 11
    }

    func f(x: Int64): Int64

    func f(x: T) {
        return 13
    }

    func f(x: Rune, y: Rune): Int64
}

interface JG<T> <: IG<T> {
    func f(x: Int64) {
        return 12
    }
    func f(x: Rune, y: Rune) {
        return 14
    }

    func f(x: Unit) {
        return 15
    }
    func f(x: Int64, y: Rune): Int64
}

class JGImpl<T> <: JG<T> {
    public func f(x: Int64, y: Rune) {
        return 16
    }
}

main() {
    let c1: J = JImpl()
    Assert.equals(1, c1.f())
    Assert.equals(2, c1.f(1))
    Assert.equals(3, c1.f(""))
    Assert.equals(4, c1.f(r'a', r'b'))
    Assert.equals(5, c1.f(()))
    Assert.equals(6, c1.f(1, r'a'))

    let c2: JG<(Int64, Int64)> = JGImpl<(Int64, Int64)> ()
    Assert.equals(11, c2.f())
    Assert.equals(12, c2.f(1))
    Assert.equals(13, c2.f((1, 1)))
    Assert.equals(14, c2.f(r'a', r'b'))
    Assert.equals(15, c2.f(()))
    Assert.equals(16, c2.f(1, r'a'))
}