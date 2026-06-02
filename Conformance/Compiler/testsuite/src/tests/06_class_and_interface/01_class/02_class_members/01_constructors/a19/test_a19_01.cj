/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a19_01

  @Level:         1

  @Assertion: 6.1.2.1(19)
              The initial value expression can refer to other parameters that have been defined before the parameter
              (excluding instance member variables defined outside the primary constructor),
              but the values of these referred parameters and member variables cannot be modified

  @Description: Check that initial values of member variable parameters can refer to
                previous parameters in the parameter list

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class TestNoNamedRegularParams {
  TestNoNamedRegularParams(
    r1: Int64,
    r2: Int64,
    r3: Int64,
    r4: Int64,
    let c1: Int64,
    var c2: Int64,
    public let c3: Int64,
    private var c4: Int64,
    public var p1!: Int64 = r1,
    public let p2!: Int64 = r2,
    protected var p3!: Int64 = r3,
    protected let p4!: Int64 = r4,
    private var p5!: Int64 = c1,
    private let p6!: Int64 = c2,
    var p7!: Int64 = c3,
    let p8!: Int64 = c4
  ) {}

  func check() {
    Assert.equals(1, p1)
    Assert.equals(2, p2)
    Assert.equals(3, p3)
    Assert.equals(4, p4)
    Assert.equals(5, p5)
    Assert.equals(6, p6)
    Assert.equals(7, p7)
    Assert.equals(8, p8)
  }
}

class TestNoUnnamedClassParams {
  TestNoUnnamedClassParams(
    r1: Int64,
    r2: Int64,
    r3: Int64,
    r4: Int64,
    r5!: Int64,
    r6!: Int64,
    r7!: Int64,
    r8!: Int64,
    public var p1!: Int64 = r1,
    public let p2!: Int64 = r2,
    protected var p3!: Int64 = r3,
    protected let p4!: Int64 = r4,
    private var p5!: Int64 = r5,
    private let p6!: Int64 = r6,
    var p7!: Int64 = r7,
    let p8!: Int64 = r8
  ) {}

  func check() {
    Assert.equals(1, p1)
    Assert.equals(2, p2)
    Assert.equals(3, p3)
    Assert.equals(4, p4)
    Assert.equals(5, p5)
    Assert.equals(6, p6)
    Assert.equals(7, p7)
    Assert.equals(8, p8)
  }
}

class TestNamedClassParamsChain {
  TestNamedClassParamsChain(
    r: Int64,
    public var p1!: Int64 = r,
    public let p2!: Int64 = p1 + 1,
    protected var p3!: Int64 = p2 + 1,
    protected let p4!: Int64 = p3 + 1,
    private var p5!: Int64 = p4 + 1,
    private let p6!: Int64 = p5 + 1,
    var p7!: Int64 = p6 + 1,
    let p8!: Int64 = p7 + 1
  ) {}

  func check() {
    Assert.equals(-8, p1)
    Assert.equals(-7, p2)
    Assert.equals(-6, p3)
    Assert.equals(-5, p4)
    Assert.equals(-4, p5)
    Assert.equals(-3, p6)
    Assert.equals(-2, p7)
    Assert.equals(-1, p8)
  }
}

main() {
  let case1 = TestNoNamedRegularParams(1, 2, 3, 4, 5, 6, 7, 8)
  case1.check()

  let case2 = TestNoUnnamedClassParams(1, 2, 3, 4, r5: 5, r6: 6, r7: 7, r8: 8)
  case2.check()

  let case3 = TestNamedClassParamsChain(-8)
  case3.check()
}