/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a12_01

  @Level:         1

  @Assertion: 6.2.2.1(12)
              The modifier is optional when defining instance member functions in interfaces,
              as they have the semantics of by default.

  @Description: Check that instance functions of interfaces can be overridden
                in subtypes regardless of the 'open' modifier

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {
    func f1(): Unit
    func f2(): Int64
    func f3(x: Int64): Unit
    func f4(x: Int64): Int64

    func f5() {}
    func f6() {
        return 0
    }
    func f7(x: Int64) {}
    func f8(x: Int64) {
        return 0
    }

    func f9(): Unit
    func f10(): Int64
    func f11(x: Int64): Unit
    func f12(x: Int64): Int64

    func f13() {}
    func f14() {
        return 0
    }
    func f15(x: Int64) {}
    func f16(x: Int64) {
        return 0
    }
}

interface J <: I {
    override func f1() {}
    override func f2() {
        return 1
    }
    override func f3(x: Int64) {}
    override func f4(x: Int64) {
        return 2
    }

    override func f5() {}
    override func f6() {
        return 3
    }
    override func f7(x: Int64) {}
    override func f8(x: Int64) {
        return 4
    }

    override func f9() {}
    override func f10() {
        return 5
    }
    override func f11(x: Int64) {}
    override func f12(x: Int64) {
        return 6
    }

    override func f13() {}
    override func f14() {
        return 7
    }
    override func f15(x: Int64) {}
    override func f16(x: Int64) {
        return 8
    }
}

class JImpl <: J {}

class C <: I {
    public override func f1() {}
    public override func f2() {
        return 10
    }
    public override func f3(x: Int64) {}
    public override func f4(x: Int64) {
        return 20
    }

    public override func f5() {}
    public override func f6() {
        return 30
    }
    public override func f7(x: Int64) {}
    public override func f8(x: Int64) {
        return 40
    }

    public override func f9() {}
    public override func f10() {
        return 50
    }
    public override func f11(x: Int64) {}
    public override func f12(x: Int64) {
        return 60
    }

    public override func f13() {}
    public override func f14() {
        return 70
    }
    public override func f15(x: Int64) {}
    public override func f16(x: Int64) {
        return 80
    }
}

struct S <: I {
    public override func f1() {}
    public override func f2() {
        return 100
    }
    public override func f3(x: Int64) {}
    public override func f4(x: Int64) {
        return 200
    }

    public override func f5() {}
    public override func f6() {
        return 300
    }
    public override func f7(x: Int64) {}
    public override func f8(x: Int64) {
        return 400
    }

    public override func f9() {}
    public override func f10() {
        return 500
    }
    public override func f11(x: Int64) {}
    public override func f12(x: Int64) {
        return 600
    }

    public override func f13() {}
    public override func f14() {
        return 700
    }
    public override func f15(x: Int64) {}
    public override func f16(x: Int64) {
        return 800
    }
}

enum E <: I {
    EConst(Int64)
    public override func f1() {}
    public override func f2() {
        return 1000
    }
    public override func f3(x: Int64) {}
    public override func f4(x: Int64) {
        return 2000
    }

    public override func f5() {}
    public override func f6() {
        return 3000
    }
    public override func f7(x: Int64) {}
    public override func f8(x: Int64) {
        return 4000
    }

    public override func f9() {}
    public override func f10() {
        return 5000
    }
    public override func f11(x: Int64) {}
    public override func f12(x: Int64) {
        return 6000
    }

    public override func f13() {}
    public override func f14() {
        return 7000
    }
    public override func f15(x: Int64) {}
    public override func f16(x: Int64) {
        return 8000
    }
}

main() {
    let tst1 = JImpl()
    Assert.isTrue(tst1.f1() is Unit)
    Assert.equals(1, tst1.f2())
    Assert.isTrue(tst1.f3(0) is Unit)
    Assert.equals(2, tst1.f4(0))
    Assert.isTrue(tst1.f5() is Unit)
    Assert.equals(3, tst1.f6())
    Assert.isTrue(tst1.f7(0) is Unit)
    Assert.equals(4, tst1.f8(0))
    Assert.isTrue(tst1.f9() is Unit)
    Assert.equals(5, tst1.f10())
    Assert.isTrue(tst1.f11(0) is Unit)
    Assert.equals(6, tst1.f12(0))
    Assert.isTrue(tst1.f13() is Unit)
    Assert.equals(7, tst1.f14())
    Assert.isTrue(tst1.f15(0) is Unit)
    Assert.equals(8, tst1.f16(0))

    let tst2 = C()
    Assert.isTrue(tst2.f1() is Unit)
    Assert.equals(10, tst2.f2())
    Assert.isTrue(tst2.f3(0) is Unit)
    Assert.equals(20, tst2.f4(0))
    Assert.isTrue(tst2.f5() is Unit)
    Assert.equals(30, tst2.f6())
    Assert.isTrue(tst2.f7(0) is Unit)
    Assert.equals(40, tst2.f8(0))
    Assert.isTrue(tst2.f9() is Unit)
    Assert.equals(50, tst2.f10())
    Assert.isTrue(tst2.f11(0) is Unit)
    Assert.equals(60, tst2.f12(0))
    Assert.isTrue(tst2.f13() is Unit)
    Assert.equals(70, tst2.f14())
    Assert.isTrue(tst2.f15(0) is Unit)
    Assert.equals(80, tst2.f16(0))

    let tst3 = S()
    Assert.isTrue(tst3.f1() is Unit)
    Assert.equals(100, tst3.f2())
    Assert.isTrue(tst3.f3(0) is Unit)
    Assert.equals(200, tst3.f4(0))
    Assert.isTrue(tst3.f5() is Unit)
    Assert.equals(300, tst3.f6())
    Assert.isTrue(tst3.f7(0) is Unit)
    Assert.equals(400, tst3.f8(0))
    Assert.isTrue(tst3.f9() is Unit)
    Assert.equals(500, tst3.f10())
    Assert.isTrue(tst3.f11(0) is Unit)
    Assert.equals(600, tst3.f12(0))
    Assert.isTrue(tst3.f13() is Unit)
    Assert.equals(700, tst3.f14())
    Assert.isTrue(tst3.f15(0) is Unit)
    Assert.equals(800, tst3.f16(0))

    let tst4 = E.EConst(10)
    Assert.isTrue(tst4.f1() is Unit)
    Assert.equals(1000, tst4.f2())
    Assert.isTrue(tst4.f3(0) is Unit)
    Assert.equals(2000, tst4.f4(0))
    Assert.isTrue(tst4.f5() is Unit)
    Assert.equals(3000, tst4.f6())
    Assert.isTrue(tst4.f7(0) is Unit)
    Assert.equals(4000, tst4.f8(0))
    Assert.isTrue(tst4.f9() is Unit)
    Assert.equals(5000, tst4.f10())
    Assert.isTrue(tst4.f11(0) is Unit)
    Assert.equals(6000, tst4.f12(0))
    Assert.isTrue(tst4.f13() is Unit)
    Assert.equals(7000, tst4.f14())
    Assert.isTrue(tst4.f15(0) is Unit)
    Assert.equals(8000, tst4.f16(0))
}