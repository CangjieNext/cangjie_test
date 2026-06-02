/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a39_01

  @Level:         1

  @Assertion: 6.1.2.4(39)
              static: The function modified with static is a static member function and must have a function body.

  @Description: Check that functions modified with the 'static' modifier
                can be accessed through the class name

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
    static func f1() {}
    static func f2(x: String) {}
    static func f3() {
        return 1
    }
    static func f4(x: Bool) {
        return 2
    }

    static func f5<T>() {}
    static func f6<T>(x: Rune) {}
    static func f7<T>() {
        return 3
    }
    static func f8<T>(x: Int64) {
        return 4
    }

    static private func f9() {}
    static private func f10(x: String) {}
    static private func f11() {
        return 5
    }
    static private func f12(x: Bool) {
        return 6
    }

    static private func f13<T>() {}
    static private func f14<T>(x: Rune) {}
    static private func f15<T>() {
        return 7
    }
    static private func f16<T>(x: Int64) {
        return 8
    }

    static protected func f17() {}
    static protected func f18(x: String) {}
    static protected func f19() {
        return 9
    }
    static protected func f20(x: Bool) {
        return 10
    }

    static protected func f21<T>() {}
    static protected func f22<T>(x: Rune) {}
    static protected func f23<T>() {
        return 11
    }
    static protected func f24<T>(x: Int64) {
        return 12
    }

    static public func f25() {}
    static public func f26(x: String) {}
    static public func f27() {
        return 13
    }
    static public func f28(x: Bool) {
        return 14
    }

    static public func f29<T>() {}
    static public func f30<T>(x: Rune) {}
    static public func f31<T>() {
        return 15
    }
    static public func f32<T>(x: Int64) {
        return 16
    }

    static func test() {
        Assert.isTrue(Test.f1() is Unit)
        Assert.isTrue(Test.f2("") is Unit)
        Assert.equals(1, Test.f3())
        Assert.equals(2, Test.f4(false))
        Assert.isTrue(Test.f5<Unit>() is Unit)
        Assert.isTrue(Test.f6<Unit>(r'e') is Unit)
        Assert.equals(3, Test.f7<Unit>())
        Assert.equals(4, Test.f8<Unit>(12))

        Assert.isTrue(Test.f9() is Unit)
        Assert.isTrue(Test.f10("") is Unit)
        Assert.equals(5, Test.f11())
        Assert.equals(6, Test.f12(false))
        Assert.isTrue(Test.f13<Unit>() is Unit)
        Assert.isTrue(Test.f14<Unit>(r'e') is Unit)
        Assert.equals(7, Test.f15<Unit>())
        Assert.equals(8, Test.f16<Unit>(12))

        Assert.isTrue(Test.f17() is Unit)
        Assert.isTrue(Test.f18("") is Unit)
        Assert.equals(9, Test.f19())
        Assert.equals(10, Test.f20(false))
        Assert.isTrue(Test.f21<Unit>() is Unit)
        Assert.isTrue(Test.f22<Unit>(r'e') is Unit)
        Assert.equals(11, Test.f23<Unit>())
        Assert.equals(12, Test.f24<Unit>(12))

        Assert.isTrue(Test.f25() is Unit)
        Assert.isTrue(Test.f26("") is Unit)
        Assert.equals(13, Test.f27())
        Assert.equals(14, Test.f28(false))
        Assert.isTrue(Test.f29<Unit>() is Unit)
        Assert.isTrue(Test.f30<Unit>(r'e') is Unit)
        Assert.equals(15, Test.f31<Unit>())
        Assert.equals(16, Test.f32<Unit>(12))
    }
}

main() {
    Test.test()
}