/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a01_01

  @Level:         1

  @Assertion: 6.2.2.1(1)
              Interfaces can contain instance member functions and static member functions
              that are written in the same way as normal instance member functions and
              static member functions, but can have no function implementation;
              these functions are called abstract functions.

  @Description: Check that interfaces can contain correct function definitions
                with or without a body

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006357,0006630

  @Comment: the specification says "can have no function implementation"
            but it's likely a mistranslation

*/

import utils.assert.Assert

interface I {
    // Instance functions without a body
    func f1(): Unit
    func f2(): Int64
    func f3(x: String): Unit
    func f4(x: Rune, y!: Bool): (Rune, Bool)

    // Static functions without a body
    static func f5(): Unit
    static func f6(): Array<Rune>
    static func f7(x: Int32, y: UInt32, z: Unit): Unit
    static func f8(a!: Rune, b!: Rune): Rune

    // Instance functions with a body
    func f9() {}
    func f10() {
        func local(x: Int64) {
            return true
        }
        return local(1 + 2)
    }
    func f11(x: Bool) {
        let y = x
    }
    func f12(a: Unit) {
        return "X" + "${a}"
    }

    // Static functions with a body
    static func f13() {
        let x = 1
        let y = 2
        var z = 0
        z = x + y
    }
    static func f14() {
        func local(x: (Int64) -> Int64) {
            return x(10)
        }
        let lambda = {x: Int64 => x + 1}
        return local(lambda)
    }
    static func f15(a: Rune, b: Bool) {}
    static func f16(x: Int64, b: Int64, c: Int64) {
        var m = [x, b, c]
        m[1] = -1
        return m
    }

    // Generic functions without a body
    static func f17<T>(): Unit
    static func f18<T>(): Rune
    static func f19<T>(x: T): Unit
    static func f20<T>(a!: T): String

    // Generic functions with a body
    static func f21<T>() {
        var m = 1
        m = m + 1
    }
    static func f22<T>() {
        var i = 0
        for (l in 1..100:1) {
            i++
        }
        return i
    }
    static func f23<T>(x: T) {
        let unused = if (x is String) {
            1
        } else {
            0
        }
        return ()
    }
    static func f24<T>(a!: Bool, c!: Rune) {
        return "${a} ${c}"
    }

    func verify() {
        Assert.isTrue(f1() is Unit)
        Assert.equals(100, f2())
        Assert.isTrue(f3("") is Unit)
        Assert.equals(r'a', f4(r'a', y: false)[0])
        Assert.equals(false, f4(r'a', y: false)[1])

        Assert.isTrue(f5() is Unit)
        Assert.equals([r'c', r'b'], f6())
        Assert.isTrue(f7(1i32, 1u32, ()) is Unit)
        Assert.equals(r'v', f8(a: r'v', b: r'x'))

        Assert.isTrue(f9() is Unit)
        Assert.equals(true, f10())
        Assert.isTrue(f11(true) is Unit)
        Assert.equals("X()", f12(()))

        Assert.isTrue(f13() is Unit)
        Assert.equals(11, f14())
        Assert.isTrue(f15(r'a', true) is Unit)
        Assert.equals([1, -1, 3], f16(1, 2, 3))

        Assert.isTrue(f17<Unit>() is Unit)
        Assert.equals(r'u', f18<Bool>())
        Assert.isTrue(f19<Rune>(r'a') is Unit)
        Assert.equals("\\\\\\", f20<String>(a: ""))

        Assert.isTrue(f21<UInt8>() is Unit)
        Assert.equals(99, f22<IntNative>())
        Assert.isTrue(f23<(String, String)>(("", "")) is Unit)
        Assert.equals("true o", f24<Bool>(a: true, c: r'o'))
    }
}

class A <: I {
    public func f1() {}
    public func f2() {
        return 100
    }
    public func f3(x: String) {}
    public func f4(x: Rune, y!: Bool) {
        return (x, y)
    }

    public static func f5() {}
    public static func f6() {
        return [r'c', r'b']
    }
    public static func f7(x: Int32, y: UInt32, z: Unit) {}
    public static func f8(a!: Rune, b!: Rune) {
        if (a == r'x') {
            return b
        } else {
            return a
        }
    }

    public static func f17<T>() {}
    public static func f18<T>() {
        return r'u'
    }
    public static func f19<T>(x: T) {}
    public static func f20<T>(a!: T) {
        return "\\\\\\"
    }
}

main() {
    A().verify()
}