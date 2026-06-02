/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a26_02

  @Level:         1

  @Assertion: 6.1.2.4(26)
              public: A function declared with modifier public can be accessed outside the package

  @Description: Check that class member functions defined with the 'public' modifier
                can be overridden and redefined in sublasses from another package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a26_aux.cj

*/

import utils.assert.Assert

import a26.*

class Child <: ForInheritance {
    public override func f1() {
        Assert.isTrue(true)
    }
    public override func f2(x: Int64) {
        Assert.isTrue(true)
    }
    public override func f3() {
        return 10
    }
    public override func f4(x: Int64) {
        return 20
    }

    public func f5() {
        Assert.isTrue(true)
    }
    public func f6(x: Int64) {
        Assert.isTrue(true)
    }
    public func f7() {
        return 30
    }
    public func f8(x: Int64) {
        return 40
    }

    public redef static func f9() {
        Assert.isTrue(true)
    }
    public redef static func f10(x: Int64) {
        Assert.isTrue(true)
    }
    public redef static func f11() {
        return 50
    }
    public redef static func f12(x: Int64) {
        return 60
    }

    public redef static func f13<T>() {
        Assert.isTrue(true)
    }
    public redef static func f14<T>(x: Int64) {
        Assert.isTrue(true)
    }
    public redef static func f15<T>() {
        return 70
    }
    public redef static func f16<T>(x: Int64) {
        return 80
    }
}

main() {
    let tst = Child()

    Assert.isTrue(tst.f1() is Unit)
    Assert.isTrue(tst.f2(1) is Unit)
    Assert.equals(10, tst.f3())
    Assert.equals(20, tst.f4(1))

    Assert.isTrue(tst.f5() is Unit)
    Assert.isTrue(tst.f6(1) is Unit)
    Assert.equals(30, tst.f7())
    Assert.equals(40, tst.f8(1))

    Assert.isTrue(Child.f9() is Unit)
    Assert.isTrue(Child.f10(1) is Unit)
    Assert.equals(50, Child.f11())
    Assert.equals(60, Child.f12(1))

    Assert.isTrue(Child.f13<Unit>() is Unit)
    Assert.isTrue(Child.f14<Unit>(1) is Unit)
    Assert.equals(70, Child.f15<Unit>())
    Assert.equals(80, Child.f16<Unit>(1))
}