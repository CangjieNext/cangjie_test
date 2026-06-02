/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a01_04

  @Level:         1

  @Assertion: 6.3.2(1)
              Class/Interface does not allow overload between static and instance member functions.
              If the names of static member functions and instance member functions
              (including those defined by the class/interface
              and inherited from super class or super interface) of a class/interface are the same,
              a compilation error is reported.

  @Description: Check that overloading is allowed in classes between instance functions

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

abstract class A {
    public func f() {
        return 1
    }

    public func f(x: Int64): Int64

    public func f(x: String) {
        return 3
    }

    public func f(x: Rune, y: Rune): Int64
}

class B <: A {
    public func f(x: Int64) {
        return 2
    }
    public func f(x: Rune, y: Rune) {
        return 4
    }

    public func f(x: Unit) {
        return 5
    }
    public func f(x: Int64, y: Rune) {
        return 6
    }
}

abstract class AG<T> {
    public func f() {
        return 11
    }

    public func f(x: Int64): Int64

    public func f(x: T) {
        return 13
    }

    public func f(x: Rune, y: Rune): Int64
}

class BG<T> <: AG<T> {
    public func f(x: Int64) {
        return 12
    }
    public func f(x: Rune, y: Rune) {
        return 14
    }

    public func f(x: Unit) {
        return 15
    }
    public func f(x: Int64, y: Rune) {
        return 16
    }
}

main() {
    let c1 = B()
    Assert.equals(1, c1.f())
    Assert.equals(2, c1.f(1))
    Assert.equals(3, c1.f(""))
    Assert.equals(4, c1.f(r'a', r'b'))
    Assert.equals(5, c1.f(()))
    Assert.equals(6, c1.f(1, r'a'))

    let c2 = BG<Array<String>>()
    Assert.equals(11, c2.f())
    Assert.equals(12, c2.f(1))
    Assert.equals(13, c2.f(["", ""]))
    Assert.equals(14, c2.f(r'a', r'b'))
    Assert.equals(15, c2.f(()))
    Assert.equals(16, c2.f(1, r'a'))
}