/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a28_01

  @Level:         1

  @Assertion: 6.1.2.4(28)
              private: A function declared with modifier private can only be accessed in this class.
              This means that private member functions cannot be called
              through this class instance and cannot be inherited.

  @Description: Check that private member functions can be accessed anywhere inside the class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006264, 0006136, 0006124

*/

import utils.assert.Assert

class Test {
    private func f1() {}
    private func f2(x: Rune) {}
    private func f3() {
        return 1
    }
    private func f4(x: Rune) {
        return 2
    }

    private func f5<T>() {}
    private func f6<T>(x: Rune) {}
    private func f7<T>() {
        return 3
    }
    private func f8<T>(x: Rune) {
        return 4
    }

    private static func f9() {}
    private static func f10(x: Rune) {}
    private static func f11() {
        return 5
    }
    private static func f12(x: Rune) {
        return 6
    }

    private static func f13<T>() {}
    private static func f14<T>(x: Rune) {}
    private static func f15<T>() {
        return 7
    }
    private static func f16<T>(x: Rune) {
        return 8
    }

    static func test_static() {
        let obj = Test()
        Assert.isTrue(obj.f1() is Unit)
        Assert.isTrue(obj.f2(r'1') is Unit)
        Assert.equals(1, obj.f3())
        Assert.equals(2, obj.f4(r'1'))
        Assert.isTrue(obj.f5<Unit>() is Unit)
        Assert.isTrue(obj.f6<Unit>(r'1') is Unit)
        Assert.equals(3, obj.f7<Unit>())
        Assert.equals(4, obj.f8<Unit>(r'1'))
        Assert.isTrue(Test.f9() is Unit)
        Assert.isTrue(Test.f10(r'1') is Unit)
        Assert.equals(5, Test.f11())
        Assert.equals(6, Test.f12(r'1'))
        Assert.isTrue(Test.f13<Unit>() is Unit)
        Assert.isTrue(Test.f14<Unit>(r'1') is Unit)
        Assert.equals(7, Test.f15<Unit>())
        Assert.equals(8, Test.f16<Unit>(r'1'))
    }

    func test_instance() {
        let obj = Test()
        Assert.isTrue(obj.f1() is Unit)
        Assert.isTrue(obj.f2(r'1') is Unit)
        Assert.equals(1, obj.f3())
        Assert.equals(2, obj.f4(r'1'))
        Assert.isTrue(obj.f5<Unit>() is Unit)
        Assert.isTrue(obj.f6<Unit>(r'1') is Unit)
        Assert.equals(3, obj.f7<Unit>())
        Assert.equals(4, obj.f8<Unit>(r'1'))
        Assert.isTrue(Test.f9() is Unit)
        Assert.isTrue(Test.f10(r'1') is Unit)
        Assert.equals(5, Test.f11())
        Assert.equals(6, Test.f12(r'1'))
        Assert.isTrue(Test.f13<Unit>() is Unit)
        Assert.isTrue(Test.f14<Unit>(r'1') is Unit)
        Assert.equals(7, Test.f15<Unit>())
        Assert.equals(8, Test.f16<Unit>(r'1'))

        // Direct access
        Assert.isTrue(f1() is Unit)
        Assert.isTrue(f2(r'1') is Unit)
        Assert.equals(1, f3())
        Assert.equals(2, f4(r'1'))
        Assert.isTrue(f5<Unit>() is Unit)
        Assert.isTrue(f6<Unit>(r'1') is Unit)
        Assert.equals(3, f7<Unit>())
        Assert.equals(4, f8<Unit>(r'1'))
        Assert.isTrue(f9() is Unit)
        Assert.isTrue(f10(r'1') is Unit)
        Assert.equals(5, f11())
        Assert.equals(6, f12(r'1'))
        Assert.isTrue(f13<Unit>() is Unit)
        Assert.isTrue(f14<Unit>(r'1') is Unit)
        Assert.equals(7, f15<Unit>())
        Assert.equals(8, f16<Unit>(r'1'))
    }

    // Check access inside a constructor
    init(x: Int64) {
        let obj = Test()
        Assert.isTrue(obj.f1() is Unit)
        Assert.isTrue(obj.f2(r'1') is Unit)
        Assert.equals(1, obj.f3())
        Assert.equals(2, obj.f4(r'1'))
        Assert.isTrue(obj.f5<Unit>() is Unit)
        Assert.isTrue(obj.f6<Unit>(r'1') is Unit)
        Assert.equals(3, obj.f7<Unit>())
        Assert.equals(4, obj.f8<Unit>(r'1'))
        Assert.isTrue(Test.f9() is Unit)
        Assert.isTrue(Test.f10(r'1') is Unit)
        Assert.equals(5, Test.f11())
        Assert.equals(6, Test.f12(r'1'))
        Assert.isTrue(Test.f13<Unit>() is Unit)
        Assert.isTrue(Test.f14<Unit>(r'1') is Unit)
        Assert.equals(7, Test.f15<Unit>())
        Assert.equals(8, Test.f16<Unit>(r'1'))
    }

    init() {}

    // Check access inside the static initializer
    static init() {
        let obj = Test()
        Assert.isTrue(obj.f1() is Unit)
        Assert.isTrue(obj.f2(r'1') is Unit)
        Assert.equals(1, obj.f3())
        Assert.equals(2, obj.f4(r'1'))
        Assert.isTrue(obj.f5<Unit>() is Unit)
        Assert.isTrue(obj.f6<Unit>(r'1') is Unit)
        Assert.equals(3, obj.f7<Unit>())
        Assert.equals(4, obj.f8<Unit>(r'1'))
        Assert.isTrue(Test.f9() is Unit)
        Assert.isTrue(Test.f10(r'1') is Unit)
        Assert.equals(5, Test.f11())
        Assert.equals(6, Test.f12(r'1'))
        Assert.isTrue(Test.f13<Unit>() is Unit)
        Assert.isTrue(Test.f14<Unit>(r'1') is Unit)
        Assert.equals(7, Test.f15<Unit>())
        Assert.equals(8, Test.f16<Unit>(r'1'))
    }

    // Check access inside an instance property
    mut prop ip: Int64 {
        get() {
            let obj = Test()
            Assert.isTrue(obj.f1() is Unit)
            Assert.isTrue(obj.f2(r'1') is Unit)
            Assert.equals(1, obj.f3())
            Assert.equals(2, obj.f4(r'1'))
            Assert.isTrue(obj.f5<Unit>() is Unit)
            Assert.isTrue(obj.f6<Unit>(r'1') is Unit)
            Assert.equals(3, obj.f7<Unit>())
            Assert.equals(4, obj.f8<Unit>(r'1'))
            Assert.isTrue(Test.f9() is Unit)
            Assert.isTrue(Test.f10(r'1') is Unit)
            Assert.equals(5, Test.f11())
            Assert.equals(6, Test.f12(r'1'))
            Assert.isTrue(Test.f13<Unit>() is Unit)
            Assert.isTrue(Test.f14<Unit>(r'1') is Unit)
            Assert.equals(7, Test.f15<Unit>())
            Assert.equals(8, Test.f16<Unit>(r'1'))
            10
        }
        set(v) {
            let obj = Test()
            Assert.isTrue(obj.f1() is Unit)
            Assert.isTrue(obj.f2(r'1') is Unit)
            Assert.equals(1, obj.f3())
            Assert.equals(2, obj.f4(r'1'))
            Assert.isTrue(obj.f5<Unit>() is Unit)
            Assert.isTrue(obj.f6<Unit>(r'1') is Unit)
            Assert.equals(3, obj.f7<Unit>())
            Assert.equals(4, obj.f8<Unit>(r'1'))
            Assert.isTrue(Test.f9() is Unit)
            Assert.isTrue(Test.f10(r'1') is Unit)
            Assert.equals(5, Test.f11())
            Assert.equals(6, Test.f12(r'1'))
            Assert.isTrue(Test.f13<Unit>() is Unit)
            Assert.isTrue(Test.f14<Unit>(r'1') is Unit)
            Assert.equals(7, Test.f15<Unit>())
            Assert.equals(8, Test.f16<Unit>(r'1'))
        }
    }

    // Check access inside a static property
    static mut prop sp: Int64 {
        get() {
            let obj = Test()
            Assert.isTrue(obj.f1() is Unit)
            Assert.isTrue(obj.f2(r'1') is Unit)
            Assert.equals(1, obj.f3())
            Assert.equals(2, obj.f4(r'1'))
            Assert.isTrue(obj.f5<Unit>() is Unit)
            Assert.isTrue(obj.f6<Unit>(r'1') is Unit)
            Assert.equals(3, obj.f7<Unit>())
            Assert.equals(4, obj.f8<Unit>(r'1'))
            Assert.isTrue(Test.f9() is Unit)
            Assert.isTrue(Test.f10(r'1') is Unit)
            Assert.equals(5, Test.f11())
            Assert.equals(6, Test.f12(r'1'))
            Assert.isTrue(Test.f13<Unit>() is Unit)
            Assert.isTrue(Test.f14<Unit>(r'1') is Unit)
            Assert.equals(7, Test.f15<Unit>())
            Assert.equals(8, Test.f16<Unit>(r'1'))
            10
        }
        set(v) {
            let obj = Test()
            Assert.isTrue(obj.f1() is Unit)
            Assert.isTrue(obj.f2(r'1') is Unit)
            Assert.equals(1, obj.f3())
            Assert.equals(2, obj.f4(r'1'))
            Assert.isTrue(obj.f5<Unit>() is Unit)
            Assert.isTrue(obj.f6<Unit>(r'1') is Unit)
            Assert.equals(3, obj.f7<Unit>())
            Assert.equals(4, obj.f8<Unit>(r'1'))
            Assert.isTrue(Test.f9() is Unit)
            Assert.isTrue(Test.f10(r'1') is Unit)
            Assert.equals(5, Test.f11())
            Assert.equals(6, Test.f12(r'1'))
            Assert.isTrue(Test.f13<Unit>() is Unit)
            Assert.isTrue(Test.f14<Unit>(r'1') is Unit)
            Assert.equals(7, Test.f15<Unit>())
            Assert.equals(8, Test.f16<Unit>(r'1'))
        }
    }
}

main() {
    let tst = Test(1)
    tst.test_instance()
    tst.ip
    tst.ip = 1

    Test.test_static()
    Test.sp
    Test.sp = 1
}