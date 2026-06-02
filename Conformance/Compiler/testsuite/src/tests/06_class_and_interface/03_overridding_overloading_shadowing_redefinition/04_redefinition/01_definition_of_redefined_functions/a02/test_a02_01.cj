/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a02_01

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(2)
              A function and its redefined versions must share the same name.

  @Description: Check that a class can redefine static functions with the same name

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

abstract class A {
    public static func f1() {
        return 0
    }
    public static func f2(x: Bool) {
        return 0
    }
    public static func f3<T>() {
        return 0
    }
    public static func f4<T>(x: Bool) {
        return 0
    }
}

open class B {
    public static func f1() {
        return 0
    }
    public static func f2(x: Bool) {
        return 0
    }
    public static func f3<T>() {
        return 0
    }
    public static func f4<T>(x: Bool) {
        return 0
    }
}

open class C {
    public static func f1() {
        return 0
    }
    public static func f2(x: Bool) {
        return 0
    }
    public static func f3<T>() {
        return 0
    }
    public static func f4<T>(x: Bool) {
        return 0
    }
}

interface I {
    static func f1(): Int64
    static func f2(x: Bool): Int64
    static func f3() {
        return 0
    }
    static func f4(x: Bool) {
        return 0
    }
    static func f5<T>(): Int64
    static func f6<T>(x: Bool): Int64
    static func f7<T>() {
        return 0
    }
    static func f8<T>(x: Bool) {
        return 0
    }
}

class T1 <: A {
    public redef static func f1() {
        return 11
    }
    public redef static func f2(x: Bool) {
        return 12
    }
    public redef static func f3<T>() {
        return 13
    }
    public redef static func f4<T>(x: Bool) {
        return 14
    }
}

class T2 <: B {
    public redef static func f1() {
        return 21
    }
    public redef static func f2(x: Bool) {
        return 22
    }
    public redef static func f3<T>() {
        return 23
    }
    public redef static func f4<T>(x: Bool) {
        return 24
    }
}

class T3 <: C {
    public redef static func f1() {
        return 31
    }
    public redef static func f2(x: Bool) {
        return 32
    }
    public redef static func f3<T>() {
        return 33
    }
    public redef static func f4<T>(x: Bool) {
        return 34
    }
}

class T4 <: I {
    public redef static func f1() {
        return 41
    }
    public redef static func f2(x: Bool) {
        return 42
    }
    public redef static func f3() {
        return 43
    }
    public redef static func f4(x: Bool) {
        return 44
    }
    public redef static func f5<T>() {
        return 45
    }
    public redef static func f6<T>(x: Bool) {
        return 46
    }
    public redef static func f7<T>() {
        return 47
    }
    public redef static func f8<T>(x: Bool) {
        return 48
    }
}

main() {
    Assert.equals(11, T1.f1())
    Assert.equals(12, T1.f2(true))
    Assert.equals(13, T1.f3<Unit>())
    Assert.equals(14, T1.f4<Unit>(true))

    Assert.equals(21, T2.f1())
    Assert.equals(22, T2.f2(true))
    Assert.equals(23, T2.f3<Unit>())
    Assert.equals(24, T2.f4<Unit>(true))

    Assert.equals(31, T3.f1())
    Assert.equals(32, T3.f2(true))
    Assert.equals(33, T3.f3<Unit>())
    Assert.equals(34, T3.f4<Unit>(true))

    Assert.equals(41, T4.f1())
    Assert.equals(42, T4.f2(true))
    Assert.equals(43, T4.f3())
    Assert.equals(44, T4.f4(true))
    Assert.equals(45, T4.f5<Unit>())
    Assert.equals(46, T4.f6<Unit>(true))
    Assert.equals(47, T4.f7<Unit>())
    Assert.equals(48, T4.f8<Unit>(true))
}