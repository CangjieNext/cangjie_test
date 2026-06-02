/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_a03_01

  @Level:         1

  @Assertion: 6.2(3)
              The members of an interface can contain instance member functions,
              static member functions, operator overloaded functions,
              instance member properties and static member properties that are abstract,
              but functions and properties can be defined with default implementations.

  @Description: Check that an interface can contain all the listed members

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

interface I {
    func f1(): Unit
    func f2(): Int64
    func f3(x: Int64): Unit
    func f4(x: Rune): String
    func f5() {}
    func f6() {
        return 10
    }
    func f7(x: Int64) {}
    func f8(x: Rune) {
        return "${x}"
    }
    static func f9() {}
    static func f10() {
        return 100
    }
    static func f11(x: Int64) {}
    static func f12(x: Unit) {
        return [1, 2, 3]
    }

    operator func +(rhs: I): Int64
    operator func !() {
        return false
    }

    prop p1: Unit
    mut prop p2: Int64
    prop p3: String {
        get() {
            ""
        }
    }
    mut prop p4: Rune {
        get() {
            r'a'
        }
        set(v) {}
    }
    static prop p5: Bool {
        get() {
            true
        }
    }
    static mut prop p6: Float32 {
        get() {
            1.5f32
        }
        set(v) {}
    }
}

interface IG<T> {
    func f1(): Unit
    func f2(): Int64
    func f3(x: Int64): Unit
    func f4(x: Rune): String
    func f5() {}
    func f6() {
        return -10
    }
    func f7(x: Int64) {}
    func f8(x: Rune) {
        return "${x}"
    }
    static func f9() {}
    static func f10() {
        return -100
    }
    static func f11(x: Int64) {}
    static func f12(x: Unit) {
        return 1..10:1
    }

    operator func +(rhs: IG<T>): Int64
    operator func !() {
        return true
    }

    prop p1: Array<String>
    mut prop p2: Int64
    prop p3: String {
        get() {
            "NNmN"
        }
    }
    mut prop p4: Rune {
        get() {
            r't'
        }
        set(v) {}
    }
    static prop p5: Int32 {
        get() {
            1i32
        }
    }
    static mut prop p6: Float32 {
        get() {
            0.5f32
        }
        set(v) {}
    }
}

class C1 <: I {
    public func f1() {}
    public func f2() {
        return 1
    }
    public func f3(x: Int64) {}
    public func f4(x: Rune) {
        return "B"
    }
    public operator func +(rhs: I) {
        return 2
    }
    public prop p1: Unit {
        get() {
            ()
        }
    }
    public mut prop p2: Int64 {
        get() {
            3
        }
        set(v) {}
    }
}

class C2 <: IG<Unit> {
    public func f1() {}
    public func f2() {
        return -1
    }
    public func f3(x: Int64) {}
    public func f4(x: Rune) {
        return "O"
    }
    public operator func +(rhs: IG<Unit>) {
        return -2
    }
    public prop p1: Array<String> {
        get() {
            ["1", "2"]
        }
    }
    public mut prop p2: Int64 {
        get() {
            -3
        }
        set(v) {}
    }
}

main() {
    let tst1 = C1()
    Assert.isTrue(tst1.f1() is Unit)
    Assert.equals(1, tst1.f2())
    Assert.isTrue(tst1.f3(1) is Unit)
    Assert.equals("B", tst1.f4(r'e'))
    Assert.isTrue(tst1.f5() is Unit)
    Assert.equals(10, tst1.f6())
    Assert.isTrue(tst1.f7(1) is Unit)
    Assert.equals("[", tst1.f8(r'['))
    Assert.isTrue(I.f9() is Unit)
    Assert.equals(100, I.f10())
    Assert.isTrue(I.f11(12) is Unit)
    Assert.equals([1, 2, 3], I.f12(()))
    Assert.equals(2, tst1 + tst1)
    Assert.equals(false, !tst1)
    Assert.isTrue(tst1.p1 is Unit)
    Assert.equals(3, tst1.p2)
    Assert.equals("", tst1.p3)
    Assert.equals(r'a', tst1.p4)
    Assert.equals(true, I.p5)
    Assert.approxEquals(1.5f32, I.p6)

    let tst2 = C2()
    Assert.isTrue(tst2.f1() is Unit)
    Assert.equals(-1, tst2.f2())
    Assert.isTrue(tst2.f3(1) is Unit)
    Assert.equals("O", tst2.f4(r'e'))
    Assert.isTrue(tst2.f5() is Unit)
    Assert.equals(-10, tst2.f6())
    Assert.isTrue(tst2.f7(1) is Unit)
    Assert.equals("]", tst2.f8(r']'))
    Assert.isTrue(IG<Unit>.f9() is Unit)
    Assert.equals(-100, IG<Unit>.f10())
    Assert.isTrue(IG<Unit>.f11(12) is Unit)
    Assert.equals(1..10:1, IG<Unit>.f12(()))
    Assert.equals(-2, tst2 + tst2)
    Assert.equals(true, !tst2)
    Assert.equals(["1", "2"], tst2.p1)
    Assert.equals(-3, tst2.p2)
    Assert.equals("NNmN", tst2.p3)
    Assert.equals(r't', tst2.p4)
    Assert.equals(1i32, IG<Unit>.p5)
    Assert.approxEquals(0.5f32, IG<Unit>.p6)
}