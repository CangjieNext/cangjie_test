/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a16_02

  @Level:         1

  @Assertion: 6.1.2.3(16)
              Static variables are inherited by subclasses,
              and the static variables of subclasses and parent classes are the same.

  @Description: Check that static member variables inherited from open classes
                are shared between the parent and child without copying

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

public struct TestA1602 {
    TestA1602(var x: Int64) {}
}

open class A {
    static public var s1 = TestA1602(1)
    static public let s2 = TestA1602(2)
    static protected var s3 = TestA1602(3)
    static protected let s4 = TestA1602(4)
    static var s5 = TestA1602(5)
    static let s6 = TestA1602(6)
}

class B <: A {}

func test_open() {
    // For immutable variables just check values through both classes
    Assert.equals(A.s2.x, B.s2.x)
    Assert.equals(A.s4.x, B.s4.x)
    Assert.equals(A.s6.x, B.s6.x)

    // For mutable variables check that changing a variable of a value type
    // through one class, also changes the variable in another,
    // ensuring that the variable is the same in both classes
    // and was not copied
    Assert.equals(1, A.s1.x)
    Assert.equals(1, B.s1.x)
    A.s1.x = 10
    Assert.equals(10, B.s1.x)
    B.s1.x = 100
    Assert.equals(100, A.s1.x)

    Assert.equals(3, A.s3.x)
    Assert.equals(3, B.s3.x)
    A.s3.x = 30
    Assert.equals(30, B.s3.x)
    B.s3.x = 300
    Assert.equals(300, A.s3.x)

    Assert.equals(5, A.s5.x)
    Assert.equals(5, B.s5.x)
    A.s5.x = 50
    Assert.equals(50, B.s5.x)
    B.s5.x = 500
    Assert.equals(500, A.s5.x)
}

abstract class C {
    static public var s1 = TestA1602(-1)
    static public let s2 = TestA1602(-2)
    static protected var s3 = TestA1602(-3)
    static protected let s4 = TestA1602(-4)
    static var s5 = TestA1602(-5)
    static let s6 = TestA1602(-6)
}

class D <: C {}

func test_abstract() {
    // For immutable variables just check values through both classes
    Assert.equals(C.s2.x, D.s2.x)
    Assert.equals(C.s4.x, D.s4.x)
    Assert.equals(C.s6.x, D.s6.x)

    // For mutable variables check that changing a variable of a value type
    // through one class, also changes the variable in another,
    // ensuring that the variable is the same in both classes
    // and was not copied
    Assert.equals(-1, C.s1.x)
    Assert.equals(-1, D.s1.x)
    C.s1.x = -10
    Assert.equals(-10, D.s1.x)
    D.s1.x = -100
    Assert.equals(-100, C.s1.x)

    Assert.equals(-3, C.s3.x)
    Assert.equals(-3, D.s3.x)
    C.s3.x = -30
    Assert.equals(-30, D.s3.x)
    D.s3.x = -300
    Assert.equals(-300, C.s3.x)

    Assert.equals(-5, C.s5.x)
    Assert.equals(-5, D.s5.x)
    C.s5.x = -50
    Assert.equals(-50, D.s5.x)
    D.s5.x = -500
    Assert.equals(-500, C.s5.x)
}

sealed abstract class E {
    static public var s1 = TestA1602(1000)
    static public let s2 = TestA1602(2000)
    static protected var s3 = TestA1602(3000)
    static protected let s4 = TestA1602(4000)
    static var s5 = TestA1602(5000)
    static let s6 = TestA1602(6000)
}

class F <: E {}

func test_sealed() {
    // For immutable variables just check values through both classes
    Assert.equals(E.s2.x, F.s2.x)
    Assert.equals(E.s4.x, F.s4.x)
    Assert.equals(E.s6.x, F.s6.x)

    // For mutable variables check that changing a variable of a value type
    // through one class, also changes the variable in another,
    // ensuring that the variable is the same in both classes
    // and was not copied
    Assert.equals(1000, E.s1.x)
    Assert.equals(1000, F.s1.x)
    E.s1.x = 10000
    Assert.equals(10000, F.s1.x)
    F.s1.x = 100000
    Assert.equals(100000, E.s1.x)

    Assert.equals(3000, E.s3.x)
    Assert.equals(3000, F.s3.x)
    E.s3.x = 30000
    Assert.equals(30000, F.s3.x)
    F.s3.x = 300000
    Assert.equals(300000, E.s3.x)

    Assert.equals(5000, E.s5.x)
    Assert.equals(5000, F.s5.x)
    E.s5.x = 50000
    Assert.equals(50000, F.s5.x)
    F.s5.x = 500000
    Assert.equals(500000, E.s5.x)
}

main() {
    test_open()
    test_abstract()
    test_sealed()
}