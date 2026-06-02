/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a15_01

  @Level:         1

  @Assertion: 6.1.2.1(15)
              In the primary constructor, only instance member variable declarations can be written.

  @Description: Check that variables generated from member variable parameters
                are instance variables, i.e. are accessible through an instance object

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006183

*/

import utils.assert.Assert

class Test {
  Test(
    public var p1: Int64,
    public let p2: Int64,
    protected var p3: Int64,
    protected let p4: Int64,
    private var p5: Int64,
    private let p6: Int64,
    var p7: Int64,
    let p8: Int64,
    public var p9!: Int64,
    public let p10!: Int64,
    protected var p11!: Int64,
    protected let p12!: Int64,
    private var p13!: Int64,
    private let p14!: Int64,
    var p15!: Int64,
    let p16!: Int64
  ) {}

  func check(tst: Test) {
    Assert.equals(1, tst.p1)
    Assert.equals(2, tst.p2)
    Assert.equals(3, tst.p3)
    Assert.equals(4, tst.p4)
    Assert.equals(5, tst.p5)
    Assert.equals(6, tst.p6)
    Assert.equals(7, tst.p7)
    Assert.equals(8, tst.p8)
    Assert.equals(9, tst.p9)
    Assert.equals(10, tst.p10)
    Assert.equals(11, tst.p11)
    Assert.equals(12, tst.p12)
    Assert.equals(13, tst.p13)
    Assert.equals(14, tst.p14)
    Assert.equals(15, tst.p15)
    Assert.equals(16, tst.p16)
  }
}

main() {
  let tst = Test(1, 2, 3, 4, 5, 6, 7, 8, p9: 9, p10: 10, p11: 11, p12: 12, p13: 13, p14: 14, p15: 15, p16:16)
  tst.check(tst)
}