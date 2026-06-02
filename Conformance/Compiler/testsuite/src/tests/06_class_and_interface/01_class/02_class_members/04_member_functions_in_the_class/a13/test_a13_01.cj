/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a13_01

  @Level:         1

  @Assertion: 6.1.2.4(13)
              The open modifier is optional when defining an abstract instance member function in an abstract class.

  @Description: Check that abstract functions can be defined with or without the 'open' modifier

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

abstract class A {
    public func f1(): Int64
    open public func f2(): Int64
    protected func f3(): Int64
    open protected func f4(): Int64
    public func f5(x: Bool): Int64
    open public func f6(x: String): Int64
    protected func f7(a: Float64): Int64
    open protected func f8(b: Rune): Int64
    public func f9(a: Int64, b!: Int32): Int64
    open public func f10(a: Rune, b: String, c!: Bool): Int64
    protected func f11(x: Rune, y: Rune): Int64
    open protected func f12(h: String, u: Array<Bool>, y: Unit): Int64
}

class Test <: A {
    public func f1() {
        return 1
    }
    public func f2() {
        return 2
    }
    protected func f3() {
        return 3
    }
    protected func f4() {
        return 4
    }
    public func f5(x: Bool) {
        return 5
    }
    public func f6(x: String) {
        return 6
    }
    protected func f7(a: Float64) {
        return 7
    }
    protected func f8(b: Rune) {
        return 8
    }
    public func f9(a: Int64, b!: Int32) {
        return 9
    }
    public func f10(a: Rune, b: String, c!: Bool) {
        return 10
    }
    protected func f11(x: Rune, y: Rune) {
        return 11
    }
    protected func f12(h: String, u: Array<Bool>, y: Unit) {
        return 12
    }
}

main() {
    let tst = Test()
    Assert.equals(1, tst.f1())
    Assert.equals(2, tst.f2())
    Assert.equals(3, tst.f3())
    Assert.equals(4, tst.f4())
    Assert.equals(5, tst.f5(false))
    Assert.equals(6, tst.f6(""))
    Assert.equals(7, tst.f7(0.000012))
    Assert.equals(8, tst.f8(r'e'))
    Assert.equals(9, tst.f9(12, b: 1i32))
    Assert.equals(10, tst.f10(r'a', "rq", c: true))
    Assert.equals(11, tst.f11(r'e', r'('))
    Assert.equals(12, tst.f12("46465", [true, false], ()))
}