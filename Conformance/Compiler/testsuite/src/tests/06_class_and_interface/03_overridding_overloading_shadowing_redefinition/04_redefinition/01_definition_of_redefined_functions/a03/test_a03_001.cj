/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a03_001

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(3)
              The parameter type of the function must be the same as the redefined function.
              The same parameter list indicates that the number and
              types of parameters of a function are the same.

  @Description: Check that a class can redefine instance functions with the same name and parameter list

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

abstract class A {
    public static func f1(p1: Float64, p2: String) {
        return 0
    }
    public static func f2(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 0
    }
    public static func f3<T>(p1: Float64, p2: String) {
        return 0
    }
    public static func f4<T>(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 0
    }
}

open class B {
    public static func f1(p1: Float64, p2: String) {
        return 0
    }
    public static func f2(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 0
    }
    public static func f3<T>(p1: Float64, p2: String) {
        return 0
    }
    public static func f4<T>(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 0
    }
}

sealed abstract class C {
    public static func f1(p1: Float64, p2: String) {
        return 0
    }
    public static func f2(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 0
    }
    public static func f3<T>(p1: Float64, p2: String) {
        return 0
    }
    public static func f4<T>(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 0
    }
}

interface I {
    static func f1(p1: Float64, p2: String): Int64
    static func f2(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit): Int64
    static func f3(p1: Float64, p2: String) {
        return 0
    }
    static func f4(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 0
    }
    static func f5<T>(p1: Float64, p2: String): Int64
    static func f6<T>(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit): Int64
    static func f7<T>(p1: Float64, p2: String) {
        return 0
    }
    static func f8<T>(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 0
    }
}

class T1 <: A {
    public redef static func f1(p1: Float64, p2: String) {
        return 11
    }
    public redef static func f2(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 12
    }
    public redef static func f3<T>(p1: Float64, p2: String) {
        return 13
    }
    public redef static func f4<T>(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 14
    }
}

class T2 <: B {
    public redef static func f1(p1: Float64, p2: String) {
        return 21
    }
    public redef static func f2(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 22
    }
    public redef static func f3<T>(p1: Float64, p2: String) {
        return 23
    }
    public redef static func f4<T>(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 24
    }
}

class T3 <: C {
    public redef static func f1(p1: Float64, p2: String) {
        return 31
    }
    public redef static func f2(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 32
    }
    public redef static func f3<T>(p1: Float64, p2: String) {
        return 33
    }
    public redef static func f4<T>(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 34
    }
}

class T4 <: I {
    public redef static func f1(p1: Float64, p2: String) {
        return 41
    }
    public redef static func f2(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 42
    }
    public redef static func f3(p1: Float64, p2: String) {
        return 43
    }
    public redef static func f4(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 44
    }
    public redef static func f5<T>(p1: Float64, p2: String) {
        return 45
    }
    public redef static func f6<T>(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 46
    }
    public redef static func f7<T>(p1: Float64, p2: String) {
        return 47
    }
    public redef static func f8<T>(p1!: Int64, p2!: Bool, p3!: Rune, p4!: Unit) {
        return 48
    }
}

main() {
    let tst1 = T1()
    Assert.equals(11, T1.f1(0.1, "afarqr"))
    Assert.equals(12, T1.f2(p4: (), p1: 1, p2: false, p3: r'z'))
    Assert.equals(13, T1.f3<Unit>(0.1, "afarqr"))
    Assert.equals(14, T1.f4<Unit>(p4: (), p1: 1, p2: false, p3: r'z'))

    let tst2 = T2()
    Assert.equals(21, T2.f1(0.1, "afarqr"))
    Assert.equals(22, T2.f2(p4: (), p1: 1, p2: false, p3: r'z'))
    Assert.equals(23, T2.f3<Unit>(0.1, "afarqr"))
    Assert.equals(24, T2.f4<Unit>(p4: (), p1: 1, p2: false, p3: r'z'))

    let tst3 = T3()
    Assert.equals(31, T3.f1(0.1, "afarqr"))
    Assert.equals(32, T3.f2(p4: (), p1: 1, p2: false, p3: r'z'))
    Assert.equals(33, T3.f3<Unit>(0.1, "afarqr"))
    Assert.equals(34, T3.f4<Unit>(p4: (), p1: 1, p2: false, p3: r'z'))

    let tst4 = T4()
    Assert.equals(41, T4.f1(0.1, "afarqr"))
    Assert.equals(42, T4.f2(p4: (), p1: 1, p2: false, p3: r'z'))
    Assert.equals(43, T4.f3(0.1, "afarqr"))
    Assert.equals(44, T4.f4(p4: (), p1: 1, p2: false, p3: r'z'))
    Assert.equals(45, T4.f5<Unit>(0.1, "afarqr"))
    Assert.equals(46, T4.f6<Unit>(p4: (), p1: 1, p2: false, p3: r'z'))
    Assert.equals(47, T4.f7<Unit>(0.1, "afarqr"))
    Assert.equals(48, T4.f8<Unit>(p4: (), p1: 1, p2: false, p3: r'z'))
}