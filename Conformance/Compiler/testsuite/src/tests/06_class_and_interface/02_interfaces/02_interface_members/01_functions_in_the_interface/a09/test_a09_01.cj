/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a09_01

  @Level:         1

  @Assertion: 6.2.2.1(9)
              A static function with a function body can be called directly using the interface type.

  @Description: Check that static functions with a default implementation
                can be called through the interface type

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {
    static func f1() {}
    static func f2() {
        return 1
    }
    static func f3(x: String) {}
    static func f4(x: Rune, y!: Rune) {
        return 2
    }
    static func f5<T>() {}
    static func f6<T>() {
        return 3
    }
    static func f7<T>(x: Bool) {}
    static func f8<T>(a: Int64) {
        return 4
    }

    static func f9(): Unit
    static func f10(): Int64
    static func f11(x: Float16): Unit
    static func f12(u!: Unit): Int64
    static func f13<T>(): Unit
    static func f14<T>(): Int64
    static func f15<t>(a: Rune, b: Rune): Unit
    static func f16<T>(x: () -> Int64): Int64
}

interface J <: I {
    static func f9() {}
    static func f10() {
        return 5
    }
    static func f11(x: Float16) {}
    static func f12(u!: Unit) {
        return 6
    }
    static func f13<T>() {}
    static func f14<T>() {
        return 7
    }
    static func f15<T>(a: Rune, b: Rune) {}
    static func f16<T>(x: () -> Int64) {
        return 8
    }
}

interface K <: I {
    static func f1() {}
    static func f2() {
        return 9
    }
    static func f3(x: String) {}
    static func f4(x: Rune, y!: Rune) {
        return 10
    }
    static func f5<T>() {}
    static func f6<T>() {
        return 11
    }
    static func f7<T>(x: Bool) {}
    static func f8<T>(a: Int64) {
        return 12
    }
}

main() {
    // Check that functions with implementation can be called through the parent interface
    Assert.isTrue(I.f1() is Unit)
    Assert.equals(1, I.f2())
    Assert.isTrue(I.f3("") is Unit)
    Assert.equals(2, I.f4(r'[', y: r']'))
    Assert.isTrue(I.f5<Unit>() is Unit)
    Assert.equals(3, I.f6<Unit>())
    Assert.isTrue(I.f7<Unit>(false) is Unit)
    Assert.equals(4, I.f8<Unit>(12))

    // Check that inherited and redefined functions with implementation
    // can be called through the child interface
    Assert.isTrue(J.f1() is Unit)
    Assert.equals(1, J.f2())
    Assert.isTrue(J.f3("") is Unit)
    Assert.equals(2, J.f4(r'[', y: r']'))
    Assert.isTrue(J.f5<Unit>() is Unit)
    Assert.equals(3, J.f6<Unit>())
    Assert.isTrue(J.f7<Unit>(false) is Unit)
    Assert.equals(4, J.f8<Unit>(12))

    Assert.isTrue(J.f9() is Unit)
    Assert.equals(5, J.f10())
    Assert.isTrue(J.f11(0.1f16) is Unit)
    Assert.equals(6, J.f12(u: ()))
    Assert.isTrue(J.f13<Unit>() is Unit)
    Assert.equals(7, J.f14<Unit>())
    Assert.isTrue(J.f15<Unit>(r'(', r'(') is Unit)
    Assert.equals(8, J.f16<Unit>({=>1}))

    // Check that redefined functions that had implementation in the parent interface
    // can be called through the child interface
    Assert.isTrue(K.f1() is Unit)
    Assert.equals(9, K.f2())
    Assert.isTrue(K.f3("") is Unit)
    Assert.equals(10, K.f4(r'[', y: r']'))
    Assert.isTrue(K.f5<Unit>() is Unit)
    Assert.equals(11, K.f6<Unit>())
    Assert.isTrue(K.f7<Unit>(false) is Unit)
    Assert.equals(12, K.f8<Unit>(12))
}