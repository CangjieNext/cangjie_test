/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a02_01

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function overriding must comply with the following rules.

  @Assertion: 6.3.1.1(2)
              The name of the function must be the same as the overridden function.

  @Description: Check that a class can override instance functions with the same name

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

abstract class A {
    public func f1(): Int64
    public func f2(x: Bool): Int64
    public open func f3() {
        return 0
    }
    public open func f4(x: Bool) {
        return 0
    }
}

open class B {
    public open func f1() {
        return 0
    }
    public open func f2(x: Bool) {
        return 0
    }
}

sealed abstract class C {
    public open func f1() {
        return 0
    }
    public open func f2(x: Bool) {
        return 0
    }
}

interface I {
    func f1(): Int64
    func f2(x: Bool): Int64
    func f3() {
        return 0
    }
    func f4(x: Bool) {
        return 0
    }
}

class T1 <: A {
    public override func f1() {
        return 11
    }
    public override func f2(x: Bool) {
        return 12
    }
    public override func f3() {
        return 13
    }
    public override func f4(x: Bool) {
        return 14
    }
}

class T2 <: B {
    public override func f1() {
        return 21
    }
    public override func f2(x: Bool) {
        return 22
    }
}

class T3 <: C {
    public override func f1() {
        return 31
    }
    public override func f2(x: Bool) {
        return 32
    }
}

class T4 <: I {
    public override func f1() {
        return 41
    }
    public override func f2(x: Bool) {
        return 42
    }
    public override func f3() {
        return 43
    }
    public override func f4(x: Bool) {
        return 44
    }
}

main() {
    let tst1 = T1()
    Assert.equals(11, tst1.f1())
    Assert.equals(12, tst1.f2(true))
    Assert.equals(13, tst1.f3())
    Assert.equals(14, tst1.f4(true))

    let tst2 = T2()
    Assert.equals(21, tst2.f1())
    Assert.equals(22, tst2.f2(true))

    let tst3 = T3()
    Assert.equals(31, tst3.f1())
    Assert.equals(32, tst3.f2(true))

    let tst4 = T4()
    Assert.equals(41, tst4.f1())
    Assert.equals(42, tst4.f2(true))
    Assert.equals(43, tst4.f3())
    Assert.equals(44, tst4.f4(true))
}