/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a07_01

  @Level:         1

  @Assertion: 6.2.2.1(7)
              Functions modified with static are called static member functions and can have no function body.

  @Description: Check that functions in an interface can be modified with 'static'
                and may have a body or may omit it

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006357

  @Comment: the specification says "can have no function body"
            but it's likely a mistranslation

*/

import utils.assert.Assert

interface I {
    static func f1(): Unit
    static func f2(): Int64
    static func f3(x: Int64): Unit
    static func f4(x: Int64): Int64

    static func f5<T>(): Unit
    static func f6<T>(): Int64
    static func f7<T>(x: Int64): Unit
    static func f8<T>(x: Int64): Int64

    static func f9() {}
    static func f10() {
        return 5
    }
    static func f11(x: Int64) {}
    static func f12(x: Int64) {
        return 6
    }

    static func f13<T>() {}
    static func f14<T>() {
        return 7
    }
    static func f15<T>(x: Int64) {}
    static func f16<T>(x: Int64) {
        return 8
    }

    func verify() {
        Assert.isTrue(f1() is Unit)
        Assert.equals(1, f2())
        Assert.isTrue(f3(0) is Unit)
        Assert.equals(2, f4(0))

        Assert.isTrue(f5<Bool>() is Unit)
        Assert.equals(3, f6<Unit>())
        Assert.isTrue(f7<Rune>(0) is Unit)
        Assert.equals(4, f8<String>(0))

        Assert.isTrue(f9() is Unit)
        Assert.equals(5, f10())
        Assert.isTrue(f11(0) is Unit)
        Assert.equals(6, f12(0))

        Assert.isTrue(f13<Int64>() is Unit)
        Assert.equals(7, f14<Float32>())
        Assert.isTrue(f15<Any>(0) is Unit)
        Assert.equals(8, f16<Object>(0))
    }
}

class Impl <: I {
    redef public static func f1() {}
    redef public static func f2() {
        return 1
    }
    redef public static func f3(x: Int64) {}
    redef public static func f4(x: Int64) {
        return 2
    }

    redef public static func f5<T>() {}
    redef public static func f6<T>() {
        return 3
    }
    redef public static func f7<T>(x: Int64) {}
    redef public static func f8<T>(x: Int64) {
        return 4
    }
}

main() {
    Impl().verify()
}