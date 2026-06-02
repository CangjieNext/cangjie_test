/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a14_01

  @Level:         1

  @Assertion: 6.1.2.1(14)
              The members in the primary constructor can also be modified by using private, public, and protected.

  @Description: Check that member variable parameters in the primary constructor
                can be modified with access modifiers or have no modifiers.
                Check that members with all types of modifiers are visible inside the class.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
  Test(
    public var p1: Int64,
    public let p2: String,
    protected var p3: Bool,
    protected let p4: Rune,
    private var p5: () -> Int64,
    private let p6: Array<Int64>,
    var p7: Int64,
    let p8: Bool,
    public var np1!: Int64,
    public let np2!: String,
    protected var np3!: Bool,
    protected let np4!: Rune,
    private var np5!: () -> Int64,
    private let np6!: Array<Int64>,
    var np7!: Int64,
    let np8!: Bool
  ) {}

  func check_visibility(tst: Test) {
    // Check visibility directly by name
    Assert.equals(1, p1)
    Assert.equals("tr", p2)
    Assert.equals(false, p3)
    Assert.equals(r'c', p4)
    Assert.equals(7, p5())
    Assert.equals([1, 9], p6)
    Assert.equals(98, p7)
    Assert.equals(false, p8)
    Assert.equals(8, np1)
    Assert.equals("", np2)
    Assert.equals(true, np3)
    Assert.equals(r'l', np4)
    Assert.equals(10, np5())
    Assert.equals([9, 7, 3], np6)
    Assert.equals(60, np7)
    Assert.equals(true, np8)

    // Check visibility through an instance name
    Assert.equals(1, tst.p1)
    Assert.equals("tr", tst.p2)
    Assert.equals(false, tst.p3)
    Assert.equals(r'c', tst.p4)
    Assert.equals(7, tst.p5())
    Assert.equals([1, 9], tst.p6)
    Assert.equals(98, tst.p7)
    Assert.equals(false, tst.p8)
    Assert.equals(8, tst.np1)
    Assert.equals("", tst.np2)
    Assert.equals(true, tst.np3)
    Assert.equals(r'l', tst.np4)
    Assert.equals(10, tst.np5())
    Assert.equals([9, 7, 3], tst.np6)
    Assert.equals(60, tst.np7)
    Assert.equals(true, tst.np8)
  }
}

main() {
  let tst = Test(1, "tr", false, r'c', {=> return 7}, [1, 9], 98, false,
    np1: 8, np2: "", np3: true, np4: r'l', np5: {=> 10}, np6: [9, 7, 3], np7: 60, np8: true)
    tst.check_visibility(tst)
}