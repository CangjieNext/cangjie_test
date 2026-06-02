/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a30_01

  @Level:         1

  @Assertion: 6.1.2.1(30)
              A primary constructor is a syntax sugar of regular constructor.
              The compiler automatically generates a definition of the constructor
              and member variables corresponding to the main constructor,
              the form of the automatically generated constructor is as follows:
              • The modifier is the same as that of the primary constructor.
              • The sequence of parameters from left to right is the same as that of parameters
                declared in the primary constructor parameter list.
              • The constructor body is in the following format:
                – Assign values to member variables in sequence.
                  The syntax format is this.x = x, where x indicates the member variable name.
                – The code in the primary constructor body.

  @Description: Check that a primary constructor automatically generates
                member variables corresponding to member variable parameters

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
  Test(
    public var p1: Int64,
    protected var p2: Int64,
    private var p3: Int64,
    var p4: Int64,
    public let p5: Int64,
    protected let p6: Int64,
    private let p7: Int64,
    let p8: Int64,

    public var p9!: Int64,
    protected var p10!: Int64,
    private var p11!: Int64,
    var p12!: Int64,
    public let p13!: Int64,
    protected let p14!: Int64,
    private let p15!: Int64,
    let p16!: Int64
  ) {}

  func check() {
    Assert.equals(1, this.p1)
    Assert.equals(2, this.p2)
    Assert.equals(3, this.p3)
    Assert.equals(4, this.p4)
    Assert.equals(5, this.p5)
    Assert.equals(6, this.p6)
    Assert.equals(7, this.p7)
    Assert.equals(8, this.p8)
    Assert.equals(9, this.p9)
    Assert.equals(10, this.p10)
    Assert.equals(11, this.p11)
    Assert.equals(12, this.p12)
    Assert.equals(13, this.p13)
    Assert.equals(14, this.p14)
    Assert.equals(15, this.p15)
    Assert.equals(16, this.p16)
  }
}

main() {
  let a = Test(1, 2, 3, 4, 5, 6, 7, 8, p9: 9, p10: 10, p11: 11, p12: 12, p13: 13, p14: 14, p15: 15, p16: 16)
  a.check()
}