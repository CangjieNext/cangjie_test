/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a16_01

  @Level:         1

  @Assertion: 6.1.2.1(16)
              The member variable defined in the primary constructor
              cannot have the same name as those outside the primary constructor.

  @Description: Check that member variable parameters can be defined alongside
                other member variables if they have different names

  @Mode: run

  @Negative: no

  @Structure: single


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
    public var np1!: Int64,
    public let np2!: Int64,
    protected var np3!: Int64,
    protected let np4!: Int64,
    private var np5!: Int64,
    private let np6!: Int64,
    var np7!: Int64,
    let np8!: Int64
  ) {}

  public var _p1: Int64 = 17
  public let _p2: Int64 = 18
  protected var _p3: Int64 = 19
  protected let _p4: Int64 = 20
  private var _p5: Int64 = 21
  private let _p6: Int64 = 22
  var _p7: Int64 = 23
  let _p8: Int64 = 24
  public var _np1: Int64 = 25
  public let _np2: Int64 = 26
  protected var _np3: Int64 = 27
  protected let _np4: Int64 = 28
  private var _np5: Int64 = 29
  private let _np6: Int64 = 30
  var _np7: Int64 = 31
  let _np8: Int64 = 32

  func check() {
    Assert.equals(1, p1)
    Assert.equals(2, p2)
    Assert.equals(3, p3)
    Assert.equals(4, p4)
    Assert.equals(5, p5)
    Assert.equals(6, p6)
    Assert.equals(7, p7)
    Assert.equals(8, p8)
    Assert.equals(9, np1)
    Assert.equals(10, np2)
    Assert.equals(11, np3)
    Assert.equals(12, np4)
    Assert.equals(13, np5)
    Assert.equals(14, np6)
    Assert.equals(15, np7)
    Assert.equals(16, np8)

    Assert.equals(17, _p1)
    Assert.equals(18, _p2)
    Assert.equals(19, _p3)
    Assert.equals(20, _p4)
    Assert.equals(21, _p5)
    Assert.equals(22, _p6)
    Assert.equals(23, _p7)
    Assert.equals(24, _p8)
    Assert.equals(25, _np1)
    Assert.equals(26, _np2)
    Assert.equals(27, _np3)
    Assert.equals(28, _np4)
    Assert.equals(29, _np5)
    Assert.equals(30, _np6)
    Assert.equals(31, _np7)
    Assert.equals(32, _np8)
  }
}

main() {
  let t = Test(1, 2, 3, 4, 5, 6, 7, 8, np1: 9, np2: 10, np3: 11, np4: 12, np5: 13, np6: 14, np7: 15, np8: 16)
  t.check()
}