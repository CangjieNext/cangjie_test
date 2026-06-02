/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a14_01

  @Level:         1

  @Assertion: 6.2.2.1(14)
              Functions modified with mut are a special kind of instance member function
              that can be used to abstract the mutable behavior of struct types.

  @Description: Check that instance functions of interfaces can have the 'mut' modifier

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006358

*/

import utils.assert.Assert

interface I {
    mut func f1(): Unit
    mut func f2(): Int64
    mut func f3(x: Int64): Unit
    mut func f4(x: Int64): Int64

    mut func f5() {}
    mut func f6() {
        return 3
    }
    mut func f7(x: Int64) {}
    mut func f8(x: Int64) {
        return 4
    }

    mut func f9(): Unit
    mut func f10(): Int64
    mut func f11(x: Int64): Unit
    mut func f12(x: Int64): Int64

    mut func f13() {}
    mut func f14() {
        return 7
    }
    mut func f15(x: Int64) {}
    mut func f16(x: Int64) {
        return 8
    }
}

struct S <: I {
    S(var counter!: Int64 = 0) {}
    public override mut func f1() {
        counter++
    }
    public override mut func f2() {
        counter++
        return 1
    }
    public override mut func f3(x: Int64) {
        counter++
    }
    public override mut func f4(x: Int64) {
        counter++
        return 2
    }

    public override mut func f9() {
        counter++
    }
    public override mut func f10() {
        counter++
        return 5
    }
    public override mut func f11(x: Int64) {
        counter++
    }
    public override mut func f12(x: Int64) {
        counter++
        return 6
    }
}

main() {
    var tst = S()
    Assert.equals(0, tst.counter)
    Assert.isTrue(tst.f1() is Unit)
    Assert.equals(1, tst.counter)
    Assert.equals(1, tst.f2())
    Assert.equals(2, tst.counter)
    Assert.isTrue(tst.f3(0) is Unit)
    Assert.equals(3, tst.counter)
    Assert.equals(2, tst.f4(0))
    Assert.equals(4, tst.counter)

    Assert.isTrue(tst.f5() is Unit)
    Assert.equals(3, tst.f6())
    Assert.isTrue(tst.f7(0) is Unit)
    Assert.equals(4, tst.f8(0))

    Assert.isTrue(tst.f9() is Unit)
    Assert.equals(5, tst.counter)
    Assert.equals(5, tst.f10())
    Assert.equals(6, tst.counter)
    Assert.isTrue(tst.f11(0) is Unit)
    Assert.equals(7, tst.counter)
    Assert.equals(6, tst.f12(0))
    Assert.equals(8, tst.counter)

    Assert.isTrue(tst.f13() is Unit)
    Assert.equals(7, tst.f14())
    Assert.isTrue(tst.f15(0) is Unit)
    Assert.equals(8, tst.f16(0))
}