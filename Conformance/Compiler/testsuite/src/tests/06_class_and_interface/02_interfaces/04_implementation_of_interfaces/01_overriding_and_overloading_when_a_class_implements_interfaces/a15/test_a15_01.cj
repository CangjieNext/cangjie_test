/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a15_01

  @Level:         1

  @Assertion: 6.2.4.1(15)
              Parent and child scope functions must have the same function name but different parameter lists.

  @Description: Check that a class can overload functions declared in its superinterfaces

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: This assertion is preceded by the sentence:
            Rules for overloading functions when implements an interface:

*/

import utils.assert.Assert

// Class overloads one function several times
interface I1 {
    func f() {
        return 1
    }
}

class C1 <: I1 {
    func f(x: Int64) {
        return 2
    }

    func f(x: Int32) {
        return 3
    }

    func f(x: Int16) {
        return 4
    }

    func f(x: Int8) {
        return 5
    }

    func f(x: UInt64) {
        return 6
    }

    func f(x: UInt32) {
        return 7
    }

    func f(x: UInt16) {
        return 8
    }

    func f(x: UInt8) {
        return 9
    }

    func f(x: Float64) {
        return 10
    }

    func f(x: Float32) {
        return 11
    }

    func f(x: Float16) {
        return 12
    }

    func f(x: Rune) {
        return 13
    }

    func f(x: String) {
        return 14
    }

    func f(x: Bool) {
        return 15
    }

    func f(x: Unit) {
        return 16
    }

    func f(x: (Int64, Int64)) {
        return 17
    }

    func f(x: (Int64) -> Int64) {
        return 18
    }

    func f(x: Range<Int64>) {
        return 19
    }

    func f(x: Array<String>) {
        return 20
    }
}

// Class overloads all functions
interface I2 {
    func f1() {
        return 21
    }
    func f2() {
        return 22
    }
    func f3() {
        return 23
    }
}

class C2 <: I2 {
    func f1(x: String) {
        return 24
    }
    func f2(x: Bool) {
        return 25
    }
    func f3(x: Rune) {
        return 26
    }
}

// Class overloads one function several times
interface I3 {
    static func f() {
        return 30
    }
}

class C3 <: I3 {
    static func f(a: Int64) {
        return 31
    }
    static func f(a: Int64, b: Int64) {
        return 32
    }
    static func f(a: Int64, b: Int64, c: Int64) {
        return 33
    }
}

// Interface already has several overloaded functions
open class A {}
class B <: A {}

interface I4 {
    static func f(x: A) {
        return 41
    }

    static func f(x: B) {
        return 42
    }
}

class C4 <: I4 {
    static func f(x: (A) -> Int64) {
        return 43
    }
    static func f(x: (B) -> Int64) {
        return 44
    }
}

// Generic class overloads functions from an interface
interface I5 {
    func f(x: String, y: Rune) {
        return 51
    }
}

class C5<T> <: I5 {
    func f(a: Int64) {
        return 52
    }
}

// Generic class overloads functions from a generic interface
interface I6<T> {
    func f(x: T) {
        return 61
    }
}

class C6<T1, T2> <: I6<T1> {
    func f(x: T2) {
        return 62
    }
}

main() {
    let c1 = C1()
    Assert.equals(1, c1.f())
    Assert.equals(2, c1.f(1))
    Assert.equals(3, c1.f(1i32))
    Assert.equals(4, c1.f(1i16))
    Assert.equals(5, c1.f(1i8))
    Assert.equals(6, c1.f(1u64))
    Assert.equals(7, c1.f(1u32))
    Assert.equals(8, c1.f(1u16))
    Assert.equals(9, c1.f(1u8))
    Assert.equals(10, c1.f(.1f64))
    Assert.equals(11, c1.f(.1f32))
    Assert.equals(12, c1.f(.1f16))
    Assert.equals(13, c1.f(r'c'))
    Assert.equals(14, c1.f(""))
    Assert.equals(15, c1.f(false))
    Assert.equals(16, c1.f(()))
    Assert.equals(17, c1.f((1, 1)))
    Assert.equals(18, c1.f({x: Int64 => x + 1}))
    Assert.equals(19, c1.f(1..10:1))
    Assert.equals(20, c1.f(["", ""]))

    let c2 = C2()
    Assert.equals(21, c2.f1())
    Assert.equals(22, c2.f2())
    Assert.equals(23, c2.f3())
    Assert.equals(24, c2.f1(""))
    Assert.equals(25, c2.f2(false))
    Assert.equals(26, c2.f3(r']'))

    Assert.equals(30, C3.f())
    Assert.equals(31, C3.f(1))
    Assert.equals(32, C3.f(1, 1))
    Assert.equals(33, C3.f(1, 1, 1))

    Assert.equals(41, C4.f(A()))
    Assert.equals(42, C4.f(B()))
    Assert.equals(43, C4.f({x: A => 1}))
    Assert.equals(44, C4.f({x: B => 1}))

    let c5 = C5<Unit>()
    Assert.equals(51, c5.f("", r'a'))
    Assert.equals(52, c5.f(1))

    let c6 = C6<Int64, String>()
    Assert.equals(61, c6.f(1))
    Assert.equals(62, c6.f(""))
}