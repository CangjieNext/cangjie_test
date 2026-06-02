/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a03_01

  @Level:         1

  @Assertion: 6.2.2.1(3)
              Abstract functions can have named parameters, but cannot have parameter default values.

  @Description: Check that abstract functions in interfaces can have named parameters

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {
    func f1(x: Int64, y!: Int64): Unit
    func f2(x: Int64, y!: Int64): String
    func f3(x!: Int64, y!: Int64): Unit
    func f4(x!: Int64, y!: Int64): String

    static func f5(x: Int64, y!: Int64): Unit
    static func f6(x: Int64, y!: Int64): String
    static func f7(x!: Int64, y!: Int64): Unit
    static func f8(x!: Int64, y!: Int64): String

    func f9(x: Int64, y!: Int64) {}
    func f10(x: Int64, y!: Int64) {
        return "f10: ${x}, ${y}"
    }
    func f11(x!: Int64, y!: Int64) {}
    func f12(x!: Int64, y!: Int64) {
        return "f12: ${x}, ${y}"
    }

    static func f13(x: Int64, y!: Int64) {}
    static func f14(x: Int64, y!: Int64) {
        return "f14: ${x}, ${y}"
    }
    static func f15(x!: Int64, y!: Int64) {}
    static func f16(x!: Int64, y!: Int64){
        return "f16: ${x}, ${y}"
    }

    func verify() {
        Assert.isTrue(f1(0, y: 0) is Unit)
        Assert.equals("f2: 0, 1", f2(0, y: 1))
        Assert.isTrue(f3(x: 0, y: 0) is Unit)
        Assert.equals("f4: 0, 2", f4(x: 0, y: 2))

        Assert.isTrue(f5(0, y: 0) is Unit)
        Assert.equals("f6: 1, 1", f6(1, y: 1))
        Assert.isTrue(f7(x: 0, y: 0) is Unit)
        Assert.equals("f8: 1, 2", f8(x: 1, y: 2))

        Assert.isTrue(f9(0, y: 0) is Unit)
        Assert.equals("f10: 2, 1", f10(2, y: 1))
        Assert.isTrue(f11(x: 0, y: 0) is Unit)
        Assert.equals("f12: 2, 2", f12(y: 2, x: 2))

        Assert.isTrue(f13(0, y: 0) is Unit)
        Assert.equals("f14: 3, 1", f14(3, y: 1))
        Assert.isTrue(f15(x: 0, y: 0) is Unit)
        Assert.equals("f16: 3, 2", f16(y: 2, x: 3))
    }
}

class A <: I {
    override public func f1(x: Int64, y!: Int64) {}
    override public func f2(x: Int64, y!: Int64) {
        return "f2: ${x}, ${y}"
    }
    override public func f3(x!: Int64, y!: Int64) {}
    override public func f4(x!: Int64, y!: Int64) {
        return "f4: ${x}, ${y}"
    }

    redef public static func f5(x: Int64, y!: Int64) {}
    redef public static func f6(x: Int64, y!: Int64) {
        return "f6: ${x}, ${y}"
    }
    redef public static func f7(x!: Int64, y!: Int64) {}
    redef public static func f8(x!: Int64, y!: Int64) {
        return "f8: ${x}, ${y}"
    }
}

main() {
    A().verify()
}