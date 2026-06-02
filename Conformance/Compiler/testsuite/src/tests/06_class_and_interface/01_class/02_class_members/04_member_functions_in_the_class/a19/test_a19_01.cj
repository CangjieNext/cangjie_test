/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a19_01

  @Level:         1

  @Assertion: 6.1.2.4(19)
              Static member functions can be modified by private, protected or public.

  @Description: Check that static member functions can be modified by access modifiers

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
    static private func f1() {}
    static private func f2(x: String) {}
    static private func f3() {
        return 1
    }
    static private func f4(x: Float64, y: Bool) {
        return 2
    }

    static protected func f5() {}
    static protected func f6(x: Int64, y: Int64) {}
    static protected func f7() {
        return 3
    }
    static protected func f8(a: Rune, b!: Rune) {
        return 4
    }

    static public func f9() {}
    static public func f10(x: Bool) {}
    static public func f11() {
        return 5
    }
    static public func f12(a: Array<Int64>) {
        return 6
    }

    static private func f13<T>() {}
    static private func f14<T>(a: Unit, b: Unit, c: Unit) {}
    static private func f15<T>() {
        return 7
    }
    static private func f16<T>(y!: Range<Int64>) {
        return 8
    }

    static protected func f17<T>() {}
    static protected func f18<T>(x: Rune, y: Bool) {}
    static protected func f19<T>() {
        return 9
    }
    static protected func f20<T>(x: String, y: UInt32) {
        return 10
    }

    static public func f21<T>() {}
    static public func f22<T>(a: Rune, b: Array<Rune>) {}
    static public func f23<T>() {
        return 11
    }
    static public func f24<T>(x: Float16, y: Box<Float16>) {
        return 12
    }

    static func test() {
        Assert.isTrue(f1() is Unit)
        Assert.isTrue(f2("[[[]][[]]]") is Unit)
        Assert.equals(1, f3())
        Assert.equals(2, f4(0.1, true))

        Assert.isTrue(f5() is Unit)
        Assert.isTrue(f6(1, 2) is Unit)
        Assert.equals(3, f7())
        Assert.equals(4, f8(r't', b: r'w'))

        Assert.isTrue(f9() is Unit)
        Assert.isTrue(f10(true) is Unit)
        Assert.equals(5, f11())
        Assert.equals(6, f12([1]))

        Assert.isTrue(f13<Unit>() is Unit)
        Assert.isTrue(f14<Rune>((), (), ()) is Unit)
        Assert.equals(7, f15<IntNative>())
        Assert.equals(8, f16<String>(y: -1..=20:2))

        Assert.isTrue(f17<()->Unit>() is Unit)
        Assert.isTrue(f18<Float16>(r'b', false) is Unit)
        Assert.equals(9, f19<Bool>())
        Assert.equals(10, f20<Any>("string", 0u32))

        Assert.isTrue(f21<(Unit, Unit)>() is Unit)
        Assert.isTrue(f22<Option<String>>(r'5', [r'4', r'\'', r'q']) is Unit)
        Assert.equals(11, f23<Int8>())
        Assert.equals(12, f24<Array<Unit>>(0.001, Box(11e-32)))
    }
}

main() {
    Test.test()
}