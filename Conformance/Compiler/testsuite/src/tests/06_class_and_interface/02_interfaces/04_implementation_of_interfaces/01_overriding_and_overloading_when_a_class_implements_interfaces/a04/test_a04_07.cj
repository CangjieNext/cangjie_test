/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a04_07

  @Level:         1

  @Assertion: 6.2.4.1(4)
              The return type of the implemented function should be the same as
              or a subtype of the return type of the corresponding function in the interface.

  @Description: Check that an enum can implement abstract functions from a superinterface
                by defining functions with the same name, parameter list and the return type
                that is the same as an abstract function return type.
                The superinterface has several functions with different signatures

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {
    func f1(): Unit
    func f2(): Int64
    func f3(x: Int64): Unit
    func f4(x: Int64): Int64

    static func f5(): Unit
    static func f6(): Int64
    static func f7(x: Int64): Unit
    static func f8(x: Int64): Int64

    static func f9<T>(): Unit
    static func f10<T>(): Int64
    static func f11<T>(x: Int64): Unit
    static func f12<T>(x: Int64): Int64

    operator func !(): String
    operator func -(): Int64
    operator func +(x: Int64): Bool
    operator func [](x: Int64): Rune
}

enum A <: I1 {
    E | D
    public func f1() {}
    public func f2() {
        return 1
    }
    public func f3(x: Int64) {}
    public func f4(x: Int64) {
        return 2
    }

    public static func f5() {}
    public static func f6() {
        return 3
    }
    public static func f7(x: Int64) {}
    public static func f8(x: Int64) {
        return 4
    }

    public static func f9<T>() {}
    public static func f10<T>() {
        return 5
    }
    public static func f11<T>(x: Int64) {}
    public static func f12<T>(x: Int64) {
        return 6
    }

    public operator func !() {
        return "1"
    }
    public operator func -() {
        return 100
    }
    public operator func +(x: Int64) {
        return true
    }
    public operator func [](x: Int64) {
        return r'c'
    }

    func check() {
        Assert.isTrue(f1() is Unit)
        Assert.equals(1, f2())
        Assert.isTrue(f3(1) is Unit)
        Assert.equals(2, f4(1))

        Assert.isTrue(f5() is Unit)
        Assert.equals(3, f6())
        Assert.isTrue(f7(1) is Unit)
        Assert.equals(4, f8(1))

        Assert.isTrue(f9<Unit>() is Unit)
        Assert.equals(5, f10<Unit>())
        Assert.isTrue(f11<Unit>(1) is Unit)
        Assert.equals(6, f12<Unit>(1))

        Assert.equals("1", !this)
        Assert.equals(100, -this)
        Assert.equals(true, this + 1)
        Assert.equals(r'c', this[0])
    }
}

main() {
    A.D.check()
}