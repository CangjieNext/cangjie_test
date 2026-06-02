/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a01_05

  @Level:         1

  @Assertion: 6.3.4.1(1)
              If a non-abstract static function with a name same
              as a non-abstract static function in the superclass is declared,
              the function can be declared with an optional modifier redef
              (indicating that it redefines the existing one).

  @Description: Check that the modifier 'redef' is optional for functions
                that redefine functions with parameters of generic types

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006426

*/

import utils.assert.Assert

abstract class A<T1, T2> {
    public static func f(x: T1, y: T2) {
        return 0
    }
    public static func g<T>(x: T1, y: T2) {
        return 0
    }
}

interface I<T1, T2> {
    static func i(x: T1, y: T2) {
        return 0
    }
    static func j(x: T1, y: T2): Int64

    static func k<T>(x: T1, y: T2) {
        return 0
    }
    static func l<T>(x: T1, y: T2): Int64
}

class C1 <: A<Rune, String> & I<Int64, Bool> {
    public redef static func f(x: Rune, y: String) {
        return 11
    }
    public redef static func g<T>(x: Rune, y: String) {
        return 12
    }

    public redef static func i(x: Int64, y: Bool) {
        return 13
    }
    public redef static func j(x: Int64, y: Bool) {
        return 14
    }
    public redef static func k<T>(x: Int64, y: Bool) {
        return 15
    }
    public redef static func l<T>(x: Int64, y: Bool) {
        return 16
    }
}

class C2 <: A<Rune, String> & I<Int64, Bool> {
    public static func f(x: Rune, y: String) {
        return 21
    }
    public static func g<T>(x: Rune, y: String) {
        return 22
    }

    public static func i(x: Int64, y: Bool) {
        return 23
    }
    public static func j(x: Int64, y: Bool) {
        return 24
    }
    public static func k<T>(x: Int64, y: Bool) {
        return 25
    }
    public static func l<T>(x: Int64, y: Bool) {
        return 26
    }
}

class C3<T1, T2> <: A<T1, T2> & I<T2, T1> {
    public redef static func f(x: T1, y: T2) {
        return 31
    }
    public redef static func g<T>(x: T1, y: T2) {
        return 32
    }

    public redef static func i(x: T2, y: T1) {
        return 33
    }
    public redef static func j(x: T2, y: T1) {
        return 34
    }
    public redef static func k<T>(x: T2, y: T1) {
        return 35
    }
    public redef static func l<T>(x: T2, y: T1) {
        return 36
    }
}

class C4<T1, T2> <: A<T1, T2> & I<T2, T1> {
    public static func f(x: T1, y: T2) {
        return 41
    }
    public static func g<T>(x: T1, y: T2) {
        return 42
    }

    public static func i(x: T2, y: T1) {
        return 43
    }
    public static func j(x: T2, y: T1) {
        return 44
    }
    public static func k<T>(x: T2, y: T1) {
        return 45
    }
    public static func l<T>(x: T2, y: T1) {
        return 46
    }
}

main() {
    Assert.equals(11, C1.f(r'a', ""))
    Assert.equals(12, C1.g<Unit>(r'a', ""))
    Assert.equals(13, C1.i(1, true))
    Assert.equals(14, C1.j(1, true))
    Assert.equals(15, C1.k<Unit>(1, true))
    Assert.equals(16, C1.l<Unit>(1, true))

    Assert.equals(21, C2.f(r'a', ""))
    Assert.equals(22, C2.g<Unit>(r'a', ""))
    Assert.equals(23, C2.i(1, true))
    Assert.equals(24, C2.j(1, true))
    Assert.equals(25, C2.k<Unit>(1, true))
    Assert.equals(26, C2.l<Unit>(1, true))

    Assert.equals(31, C3<Unit, Float64>.f((), .1))
    Assert.equals(32, C3<Unit, Float64>.g<Unit>((), .1))
    Assert.equals(33, C3<Unit, Float64>.i(.1, ()))
    Assert.equals(34, C3<Unit, Float64>.j(.1, ()))
    Assert.equals(35, C3<Unit, Float64>.k<Unit>(.1, ()))
    Assert.equals(36, C3<Unit, Float64>.l<Unit>(.1, ()))

    Assert.equals(41, C4<Unit, Float64>.f((), .1))
    Assert.equals(42, C4<Unit, Float64>.g<Unit>((), .1))
    Assert.equals(43, C4<Unit, Float64>.i(.1, ()))
    Assert.equals(44, C4<Unit, Float64>.j(.1, ()))
    Assert.equals(45, C4<Unit, Float64>.k<Unit>(.1, ()))
    Assert.equals(46, C4<Unit, Float64>.l<Unit>(.1, ()))
}