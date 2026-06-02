/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a44_003

  @Level:         1

  @Assertion: 6.1.2.4(44)
              redef: When a static function redefines a static function that inherits from a parent type,
              it can be declared with an optional modifier redef.

  @Description: Check that a function redefining another one can be defined
                with or without the 'redef' modifier when inheriting from a sealed class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

sealed abstract class Sealed {
    public static func f1() {
        Assert.isTrue(false)
    }

    public static func f2(x: Int64) {
        Assert.isTrue(false)
    }

    public static func f3() {
        Assert.isTrue(false)
        return 1
    }

    public static func f4(x: Int64) {
        Assert.isTrue(false)
        return 2
    }

    protected static func f5() {
        Assert.isTrue(false)
    }

    protected static func f6(x: Int64) {
        Assert.isTrue(false)
    }

    protected static func f7() {
        Assert.isTrue(false)
        return 3
    }

    protected static func f8(x: Int64) {
        Assert.isTrue(false)
        return 4
    }

    static func f9() {
        Assert.isTrue(false)
    }

    static func f10(x: Int64) {
        Assert.isTrue(false)
    }

    static func f11() {
        Assert.isTrue(false)
        return 5
    }

    static func f12(x: Int64) {
        Assert.isTrue(false)
        return 6
    }

    public static func f13<T>() {
        Assert.isTrue(false)
    }

    public static func f14<T>(x: Int64) {
        Assert.isTrue(false)
    }

    public static func f15<T>() {
        Assert.isTrue(false)
        return 7
    }

    public static func f16<T>(x: Int64) {
        Assert.isTrue(false)
        return 8
    }

    protected static func f17<T>() {
        Assert.isTrue(false)
    }

    protected static func f18<T>(x: Int64) {
        Assert.isTrue(false)
    }

    protected static func f19<T>() {
        Assert.isTrue(false)
        return 9
    }

    protected static func f20<T>(x: Int64) {
        Assert.isTrue(false)
        return 10
    }

    static func f21<T>() {
        Assert.isTrue(false)
    }

    static func f22<T>(x: Int64) {
        Assert.isTrue(false)
    }

    static func f23<T>() {
        Assert.isTrue(false)
        return 11
    }

    static func f24<T>(x: Int64) {
        Assert.isTrue(false)
        return 12
    }
}

class Test1 <: Sealed {
    public static func f1() {}

    public static func f2(x: Int64) {}

    public static func f3() {
        return 10
    }

    public static func f4(x: Int64) {
        return 20
    }

    protected static func f5() {}

    protected static func f6(x: Int64) {}

    protected static func f7() {
        return 30
    }

    protected static func f8(x: Int64) {
        return 40
    }

    static func f9() {}

    static func f10(x: Int64) {}

    static func f11() {
        return 50
    }

    static func f12(x: Int64) {
        return 60
    }

    public static func f13<T>() {}

    public static func f14<T>(x: Int64) {}

    public static func f15<T>() {
        return 70
    }

    public static func f16<T>(x: Int64) {
        return 80
    }

    protected static func f17<T>() {}

    protected static func f18<T>(x: Int64) {}

    protected static func f19<T>() {
        return 90
    }

    protected static func f20<T>(x: Int64) {
        return 100
    }

    static func f21<T>() {}

    static func f22<T>(x: Int64) {}

    static func f23<T>() {
        return 110
    }

    static func f24<T>(x: Int64) {
        return 120
    }
}

class Test2 <: Sealed {
    redef public static func f1() {}

    redef public static func f2(x: Int64) {}

    redef public static func f3() {
        return 100
    }

    redef public static func f4(x: Int64) {
        return 200
    }

    redef protected static func f5() {}

    redef protected static func f6(x: Int64) {}

    redef protected static func f7() {
        return 300
    }

    redef protected static func f8(x: Int64) {
        return 400
    }

    redef static func f9() {}

    redef static func f10(x: Int64) {}

    redef static func f11() {
        return 500
    }

    redef static func f12(x: Int64) {
        return 600
    }

    redef public static func f13<T>() {}

    redef public static func f14<T>(x: Int64) {}

    redef public static func f15<T>() {
        return 700
    }

    redef public static func f16<T>(x: Int64) {
        return 800
    }

    redef protected static func f17<T>() {}

    redef protected static func f18<T>(x: Int64) {}

    redef protected static func f19<T>() {
        return 900
    }

    redef protected static func f20<T>(x: Int64) {
        return 1000
    }

    redef static func f21<T>() {}

    redef static func f22<T>(x: Int64) {}

    redef static func f23<T>() {
        return 1100
    }

    redef static func f24<T>(x: Int64) {
        return 1200
    }
}

main() {
    Assert.isTrue(Test1.f1() is Unit)
    Assert.isTrue(Test1.f2(1) is Unit)
    Assert.equals(10, Test1.f3())
    Assert.equals(20, Test1.f4(1))
    Assert.isTrue(Test1.f5() is Unit)
    Assert.isTrue(Test1.f6(1) is Unit)
    Assert.equals(30, Test1.f7())
    Assert.equals(40, Test1.f8(1))
    Assert.isTrue(Test1.f9() is Unit)
    Assert.isTrue(Test1.f10(1) is Unit)
    Assert.equals(50, Test1.f11())
    Assert.equals(60, Test1.f12(1))
    Assert.isTrue(Test1.f13<Unit>() is Unit)
    Assert.isTrue(Test1.f14<Unit>(1) is Unit)
    Assert.equals(70, Test1.f15<Unit>())
    Assert.equals(80, Test1.f16<Unit>(1))
    Assert.isTrue(Test1.f17<Unit>() is Unit)
    Assert.isTrue(Test1.f18<Unit>(1) is Unit)
    Assert.equals(90, Test1.f19<Unit>())
    Assert.equals(100, Test1.f20<Unit>(1))
    Assert.isTrue(Test1.f21<Unit>() is Unit)
    Assert.isTrue(Test1.f22<Unit>(1) is Unit)
    Assert.equals(110, Test1.f23<Unit>())
    Assert.equals(120, Test1.f24<Unit>(1))

    Assert.isTrue(Test2.f1() is Unit)
    Assert.isTrue(Test2.f2(1) is Unit)
    Assert.equals(100, Test2.f3())
    Assert.equals(200, Test2.f4(1))
    Assert.isTrue(Test2.f5() is Unit)
    Assert.isTrue(Test2.f6(1) is Unit)
    Assert.equals(300, Test2.f7())
    Assert.equals(400, Test2.f8(1))
    Assert.isTrue(Test2.f9() is Unit)
    Assert.isTrue(Test2.f10(1) is Unit)
    Assert.equals(500, Test2.f11())
    Assert.equals(600, Test2.f12(1))
    Assert.isTrue(Test2.f13<Unit>() is Unit)
    Assert.isTrue(Test2.f14<Unit>(1) is Unit)
    Assert.equals(700, Test2.f15<Unit>())
    Assert.equals(800, Test2.f16<Unit>(1))
    Assert.isTrue(Test2.f17<Unit>() is Unit)
    Assert.isTrue(Test2.f18<Unit>(1) is Unit)
    Assert.equals(900, Test2.f19<Unit>())
    Assert.equals(1000, Test2.f20<Unit>(1))
    Assert.isTrue(Test2.f21<Unit>() is Unit)
    Assert.isTrue(Test2.f22<Unit>(1) is Unit)
    Assert.equals(1100, Test2.f23<Unit>())
    Assert.equals(1200, Test2.f24<Unit>(1))
}