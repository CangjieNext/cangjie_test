/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a03_001

  @Level:         1

  @Assertion: 6.2.4.1(3)
              The function name and parameter list of the implemented function
              must be the same as the corresponding function in the interface.

  @Description: Check that a class can implement functions by defining a function
                with the same name and parameter list

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {
    func f1(): Unit
    func f2(x: Int64): Unit
    func f3(): Int64
    func f4(x: Int64): Int64

    static func f5(): Unit
    static func f6(x: Int64): Unit
    static func f7(): Int64
    static func f8(x: Int64): Int64

    static func f9<T>(): Unit
    static func f10<T>(x: Int64): Unit
    static func f11<T>(): Int64
    static func f12<T>(x: Int64): Int64

    operator func +(rhs: I1): Int64
    operator func -(rhs: I1): Int64
    operator func !(): Int64
    operator func [](idx: Int64): Int64
}

class A <: I1 {
    public func f1() {}
    public func f2(x: Int64) {}
    public func f3() {
        return 1
    }
    public func f4(x: Int64) {
        return 2
    }

    public static func f5() {}
    public static func f6(x: Int64) {}
    public static func f7() {
        return 3
    }
    public static func f8(x: Int64) {
        return 4
    }

    public static func f9<T>() {}
    public static func f10<T>(x: Int64) {}
    public static func f11<T>() {
        return 5
    }
    public static func f12<T>(x: Int64) {
        return 6
    }

    public operator func +(rhs: I1) {
        return 7
    }
    public operator func -(rhs: I1) {
        return 8
    }
    public operator func !() {
        return 9
    }
    public operator func [](idx: Int64) {
        return 10
    }

    func check() {
        Assert.isTrue(f1() is Unit)
        Assert.isTrue(f2(1) is Unit)
        Assert.equals(1, f3())
        Assert.equals(2, f4(1))

        Assert.isTrue(f5() is Unit)
        Assert.isTrue(f6(1) is Unit)
        Assert.equals(3, f7())
        Assert.equals(4, f8(1))

        Assert.isTrue(f9<Unit>() is Unit)
        Assert.isTrue(f10<Unit>(1) is Unit)
        Assert.equals(5, f11<Unit>())
        Assert.equals(6, f12<Unit>(1))

        Assert.equals(7, this + this)
        Assert.equals(8, this - this)
        Assert.equals(9, !this)
        Assert.equals(10, this[0])
    }
}

interface I2 {
    static func f(): Int64
    static func f(x: Int64): Int64
    static func f(x: Int64, y: Int64): Int64
    static func f(x: Int64, y: Int64, z: Int64): Int64
}

class B <: I2 {
    public static func f() {
        return 1
    }
    public static func f(x: Int64) {
        return 2
    }
    public static func f(x: Int64, y: Int64) {
        return 3
    }
    public static func f(x: Int64, y: Int64, z: Int64) {
        return 4
    }

    public func check() {
        Assert.equals(1, f())
        Assert.equals(2, f(1))
        Assert.equals(3, f(1, 2))
        Assert.equals(4, f(1, 2, 3))
    }
}

interface I3 {
    func f(a: Int64): Int64
    func f(a: Int32): Int64
    func f(a: Int16): Int64
    func f(a: Int8): Int64
    func f(a: UInt64): Int64
    func f(a: UInt32): Int64
    func f(a: UInt16): Int64
    func f(a: UInt8): Int64
    func f(a: Float64): Int64
    func f(a: Float32): Int64
    func f(a: Float16): Int64
    func f(a: Bool): Int64
    func f(a: Rune): Int64
    func f(a: String): Int64
    func f(a: Unit): Int64
    func f(a: (Rune, Rune)): Int64
    func f(a: () -> Int64): Int64
    func f(a: Range<Int64>): Int64
    func f(a: Array<Bool>): Int64
}

class C <: I3 {
    public func f(a: Int64) {
        return 1
    }
    public func f(a: Int32) {
        return 2
    }
    public func f(a: Int16) {
        return 3
    }
    public func f(a: Int8) {
        return 4
    }
    public func f(a: UInt64) {
        return 5
    }
    public func f(a: UInt32) {
        return 6
    }
    public func f(a: UInt16) {
        return 7
    }
    public func f(a: UInt8) {
        return 8
    }
    public func f(a: Float64) {
        return 9
    }
    public func f(a: Float32) {
        return 10
    }
    public func f(a: Float16) {
        return 11
    }
    public func f(a: Bool) {
        return 12
    }
    public func f(a: Rune) {
        return 13
    }
    public func f(a: String) {
        return 14
    }
    public func f(a: Unit) {
        return 15
    }
    public func f(a: (Rune, Rune)) {
        return 16
    }
    public func f(a: () -> Int64) {
        return 17
    }
    public func f(a: Range<Int64>) {
        return 18
    }
    public func f(a: Array<Bool>) {
        return 19
    }

    func check() {
        Assert.equals(1, f(1))
        Assert.equals(2, f(1i32))
        Assert.equals(3, f(1i16))
        Assert.equals(4, f(1i8))
        Assert.equals(5, f(1u64))
        Assert.equals(6, f(1u32))
        Assert.equals(7, f(1u16))
        Assert.equals(8, f(1u8))
        Assert.equals(9, f(0.1))
        Assert.equals(10, f(0.1f32))
        Assert.equals(11, f(0.1f16))
        Assert.equals(12, f(false))
        Assert.equals(13, f(r'a'))
        Assert.equals(14, f("str"))
        Assert.equals(15, f(()))
        Assert.equals(16, f((r'a', r'b')))
        Assert.equals(17, f({ => 1}))
        Assert.equals(18, f(1..10:1))
        Assert.equals(19, f([false, false]))
    }
}

main() {
    A().check()
    B().check()
    C().check()
}