/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a14_02

  @Level:         1

  @Assertion: 6.1.2.1(14)
              The members in the primary constructor can also be modified by using private, public, and protected.

  @Description: Check that member variable parameters in the primary constructor
                modified with 'public', r'protected' or no modifier
                create variables that are visible inside the package and in subclasses.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class Test {
  Test(
    public var p1: Int64,
    public let p2: String,
    protected var p3: Bool,
    protected let p4: Rune,
    var p5: () -> Int64,
    let p6: Array<Int64>,
    public var np1!: Int64,
    public let np2!: String,
    protected var np3!: Bool,
    protected let np4!: Rune,
    var np5!: () -> Int64,
    let np6!: Array<Int64>
  ) {}
}

open class SubClassOfTest <: Test {
  SubClassOfTest() {
    super(15, "eqp", true, r'&', {=> return 55}, [1, 2, 9],
    np1: 111, np2: "YY", np3: true, np4: r'@', np5: {=> -1}, np6: [0, 0, 0])
  }
  func check_sub_visibility() {
    Assert.equals(15, p1)
    Assert.equals("eqp", p2)
    Assert.equals(true, p3)
    Assert.equals(r'&', p4)
    Assert.equals(55, p5())
    Assert.equals([1, 2, 9], p6)
    Assert.equals(111, np1)
    Assert.equals("YY", np2)
    Assert.equals(true, np3)
    Assert.equals(r'@', np4)
    Assert.equals(-1, np5())
    Assert.equals([0, 0, 0], np6)
  }
}

class SubclassOfSubclass <: SubClassOfTest {
  func check_sub_sub_visibility() {
    Assert.equals(15, p1)
    Assert.equals("eqp", p2)
    Assert.equals(true, p3)
    Assert.equals(r'&', p4)
    Assert.equals(55, p5())
    Assert.equals([1, 2, 9], p6)
    Assert.equals(111, np1)
    Assert.equals("YY", np2)
    Assert.equals(true, np3)
    Assert.equals(r'@', np4)
    Assert.equals(-1, np5())
    Assert.equals([0, 0, 0], np6)
  }
}

main() {
  let tst = Test(15, "eqp", true, r'&', {=> return 55}, [1, 2, 9],
    np1: 111, np2: "YY", np3: true, np4: r'@', np5: {=> -1}, np6: [0, 0, 0])

  // Check visibility inside the package
  Assert.equals(15, tst.p1)
  Assert.equals("eqp", tst.p2)
  Assert.equals(true, tst.p3)
  Assert.equals(r'&', tst.p4)
  Assert.equals(55, tst.p5())
  Assert.equals([1, 2, 9], tst.p6)
  Assert.equals(111, tst.np1)
  Assert.equals("YY", tst.np2)
  Assert.equals(true, tst.np3)
  Assert.equals(r'@', tst.np4)
  Assert.equals(-1, tst.np5())
  Assert.equals([0, 0, 0], tst.np6)

  // Check visibility in the direct subclass
  let sub = SubClassOfTest()
  sub.check_sub_visibility()

  // Check visibility in a remote subclass
  let subsub = SubclassOfSubclass()
  subsub.check_sub_sub_visibility()
}