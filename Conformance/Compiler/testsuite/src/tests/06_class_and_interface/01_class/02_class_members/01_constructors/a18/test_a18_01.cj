/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a18_01

  @Level:         1

  @Assertion: 6.1.2.1(18)
              A member variable parameter defined by the primary constructor can have an optional initial value.

  @Description: Check that member variable named parameters can have an optional default value

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006192

  @Comment: The assertion does not specify named parameters, but the syntax description does

*/

import utils.assert.Assert

class TestNoDefault {
  TestNoDefault(
    public var p1!: Int64,
    public let p2!: Int64,
    protected var p3!: Int64,
    protected let p4!: Int64,
    private var p5!: Int64,
    private let p6!: Int64,
    var p7!: Int64,
    let p8!: Int64
  ) {}

  func check() {
    Assert.equals(10, p1)
    Assert.equals(20, p2)
    Assert.equals(30, p3)
    Assert.equals(40, p4)
    Assert.equals(50, p5)
    Assert.equals(60, p6)
    Assert.equals(70, p7)
    Assert.equals(80, p8)
  }
}

class Default {
  Default(
    public var p1!: Int64 = 1,
    public let p2!: Int64 = 2,
    protected var p3!: Int64 = 3,
    protected let p4!: Int64 = 4,
    private var p5!: Int64 = 5,
    private let p6!: Int64 = 6,
    var p7!: Int64 = 7,
    let p8!: Int64 = 8
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

class DefaultUnused {
  DefaultUnused(
    public var p1!: Int64 = 1,
    public let p2!: Int64 = 2,
    protected var p3!: Int64 = 3,
    protected let p4!: Int64 = 4,
    private var p5!: Int64 = 5,
    private let p6!: Int64 = 6,
    var p7!: Int64 = 7,
    let p8!: Int64 = 8
  ) {}

  func check() {
    Assert.equals(100, p1)
    Assert.equals(200, p2)
    Assert.equals(300, p3)
    Assert.equals(400, p4)
    Assert.equals(500, p5)
    Assert.equals(600, p6)
    Assert.equals(700, p7)
    Assert.equals(800, p8)
  }
}

main() {
  let case1 = TestNoDefault(p1:10, p2: 20, p3: 30, p4: 40, p5: 50, p6: 60, p7: 70, p8: 80)
  case1.check()

  let case2 = Default()
  case2.check()

  let case3 = DefaultUnused(p1:100, p2: 200, p3: 300, p4: 400, p5: 500, p6: 600, p7: 700, p8: 800)
  case3.check()
}